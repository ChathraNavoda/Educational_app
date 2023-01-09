import 'package:cached_network_image/cached_network_image.dart';
import 'package:educational_app/configs/themes/app_color.dart';
import 'package:educational_app/configs/themes/app_icons.dart';
import 'package:educational_app/configs/themes/custom_text_style.dart';
import 'package:educational_app/configs/themes/ui_parameters.dart';
import 'package:educational_app/controllers/question_papers/question_paper_controller.dart';
import 'package:educational_app/controllers/zoom_drawer_controller.dart';
import 'package:educational_app/screens/home/question_card.dart';
import 'package:educational_app/widgets/app_circle_button.dart';
import 'package:educational_app/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        controller: _.zoomDrawerController,
        showShadow: true,
        menuScreen: Text(
          "Hi there",
          style: TextStyle(color: Colors.red),
        ),
        mainScreen: Container(
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
                      InkWell(
                        child: const Icon(
                          AppIcons.menuLeft,
                        ),
                        onTap: controller.toogleDrawer,
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
                          itemCount:
                              _questionPaperController.allPapers.length)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
