import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:fl_klikfilm/app/modules/home/controllers/banner_controller.dart';
import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(() {
      final LocalUserController local = Get.find<LocalUserController>();
      return BannerController(authenticated: local.authentication.value);
    });
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}
