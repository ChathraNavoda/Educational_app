import 'package:educational_app/configs/themes/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    print("you have tapped");
                  },
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
