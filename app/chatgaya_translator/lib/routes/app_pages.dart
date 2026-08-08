import 'package:get/get.dart';

import '../features/splash/view/splash_screen.dart';
import '../features/translator/view/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),

    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  ];
}
