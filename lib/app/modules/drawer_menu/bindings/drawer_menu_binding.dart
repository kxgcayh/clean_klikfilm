import 'package:get/get.dart';

import 'package:fl_klikfilm/app/modules/drawer_menu/controllers/drawer_event_menu_controller.dart';

import '../controllers/drawer_menu_controller.dart';

class DrawerMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerEventMenuController>(() => DrawerEventMenuController());
    Get.put<DrawerMenuController>(DrawerMenuController());
  }
}
