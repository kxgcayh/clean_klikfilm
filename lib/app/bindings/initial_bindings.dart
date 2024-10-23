import 'package:fl_klikfilm/app/controllers/local_user_controller.dart';
import 'package:fl_klikfilm/app/controllers/theming_controller.dart';
import 'package:fl_klikfilm/app/data/third_party_provider.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<ThirdPartyProvider>(() => ThirdPartyProvider());
    Get.put<LocalUserController>(LocalUserController());
    Get.lazyPut<VideoCatalogRepository>(() {
      final LocalUserController local = Get.find<LocalUserController>();
      return VideoCatalogRepository(
        client: ApiClient(),
        commonUserData: local.common.value,
      );
    });
    Get.put<ThemingController>(ThemingController(), permanent: true);

    // await Get.putAsync(() async => await ThemingController().init());
  }
}
