import 'package:educational_app/bindings/initial_bindings.dart';
import 'package:educational_app/configs/themes/app_dark_theme.dart';
import 'package:educational_app/configs/themes/app_light_theme.dart';
import 'package:educational_app/controllers/theme_controller.dart';
import 'package:educational_app/data_uploader_screen.dart';
import 'package:educational_app/firebase_options.dart';
import 'package:educational_app/routes/app_route.dart';
import 'package:educational_app/screens/introduction/introduction.dart';
import 'package:educational_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes());
  }
}
