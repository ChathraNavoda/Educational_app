import 'package:educational_app/controllers/auth_controller.dart';
import 'package:educational_app/controllers/theme_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(Authcontroller(), permanent: true);
  }
}
