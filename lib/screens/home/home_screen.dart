import 'package:cached_network_image/cached_network_image.dart';
import 'package:educational_app/controllers/question_papers/question_paper_controller.dart';
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
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl:
                        _questionPaperController.allPapers[index].imageUrl!,
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/app_splash_logo.png"),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPapers.length)));
  }
}
