import 'package:cached_network_image/cached_network_image.dart';
import 'package:educational_app/configs/themes/app_color.dart';
import 'package:educational_app/configs/themes/app_icons.dart';
import 'package:educational_app/configs/themes/custom_text_style.dart';
import 'package:educational_app/configs/themes/ui_parameters.dart';
import 'package:educational_app/controllers/question_papers/question_paper_controller.dart';
import 'package:educational_app/screens/home/question_card.dart';
import 'package:educational_app/widgets/content_area.dart';
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
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      AppIcons.menuLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(
                            AppIcons.peace,
                          ),
                          Text("Hi dear",
                              style: detailText.copyWith(
                                  color: onSurfaceTextColor))
                        ],
                      ),
                    ),
                    Text(
                      "What do you want to learn today?",
                      style: headerText,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ContentArea(
                    addPadding: false,
                    child: Obx(() => ListView.separated(
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
                        itemCount: _questionPaperController.allPapers.length)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
