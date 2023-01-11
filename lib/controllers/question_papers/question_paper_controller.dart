import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_app/controllers/auth_controller.dart';
import 'package:educational_app/firebase_ref/references.dart';
import 'package:educational_app/models/question_paper_model.dart';
import 'package:educational_app/services/firebase_storage_services.dart';
import 'package:educational_app/utils/app_logger.dart';
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
      AppLogger.e(e);
    }
  }

  void navigateToQeustions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    Authcontroller _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        //Get.offNamed(page);
      } else {
        //Get.toNamed(page)
      }
    } else {
      print('The title is ${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
