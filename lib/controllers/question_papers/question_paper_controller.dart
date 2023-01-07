import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_app/firebase_ref/references.dart';
import 'package:educational_app/models/question_paper_model.dart';
import 'package:educational_app/services/firebase_storage_services.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageServices>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }

      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
}
