import 'package:educational_app/configs/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/login.png",
              width: 200,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                "This is a study app. You can use it as you want. If you understand how this works, you would be able to scale it.",
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
