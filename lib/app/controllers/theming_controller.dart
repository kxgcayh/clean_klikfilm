import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class ThemingController extends GetxController {
  final data = AppThemeData().obs;

  @override
  void onInit() async {
    final videoRepository = Get.find<VideoCatalogRepository>();
    final response = await videoRepository.generalThemes();
    if (response.status == 'success') data.value = response.data;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
