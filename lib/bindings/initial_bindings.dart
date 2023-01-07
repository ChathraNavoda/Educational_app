import 'package:educational_app/controllers/auth_controller.dart';
import 'package:educational_app/controllers/theme_controller.dart';
import 'package:educational_app/services/firebase_storage_services.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(Authcontroller(), permanent: true);
    Get.lazyPut(() => FirebaseStorageServices());
  }
}
