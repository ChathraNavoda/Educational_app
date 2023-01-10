import 'package:educational_app/configs/themes/app_color.dart';
import 'package:educational_app/configs/themes/ui_parameters.dart';
import 'package:educational_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: onSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  controller.toogleDrawer();
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
