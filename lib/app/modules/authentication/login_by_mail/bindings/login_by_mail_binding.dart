import 'package:get/get.dart';

import '../controllers/login_by_mail_controller.dart';

class LoginByMailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginByMailController>(
      () => LoginByMailController(),
    );
  }
}
