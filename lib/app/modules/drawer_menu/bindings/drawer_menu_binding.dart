import 'package:get/get.dart';

import '../controllers/drawer_menu_controller.dart';

class DrawerMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerMenuController>(
      () => DrawerMenuController(),
    );
  }
}
