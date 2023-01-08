import 'package:cached_network_image/cached_network_image.dart';
import 'package:educational_app/configs/themes/ui_parameters.dart';
import 'package:educational_app/controllers/question_papers/question_paper_controller.dart';
import 'package:educational_app/screens/home/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: Obx(() => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                model: _questionPaperController.allPapers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPapers.length)));
  }
}
