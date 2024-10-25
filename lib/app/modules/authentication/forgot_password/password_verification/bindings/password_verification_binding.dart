import 'package:get/get.dart';

import '../controllers/password_verification_controller.dart';

class PasswordVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordVerificationController>(
      () => PasswordVerificationController(),
    );
  }
}
