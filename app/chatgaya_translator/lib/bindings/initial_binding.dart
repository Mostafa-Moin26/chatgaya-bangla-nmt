import 'package:get/get.dart';

import '../features/splash/controller/splash_controller.dart';
import '../features/translator/controller/translator_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);

    Get.lazyPut<TranslatorController>(
      () => TranslatorController(),
      fenix: true,
    );
  }
}
