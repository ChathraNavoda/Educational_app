import 'package:educational_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() =>
      [GetPage(name: "/", page: () => SplashScreen())];
}
