import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class ThemingController extends GetxController {
  final data = AppThemeData().obs;

  @override
  void onInit() async {
    final box = GetStorage();
    final localTheme = await box.read(PreferencesKey.THEME_KEY);
    if (localTheme != null) {
      data.value = AppThemeData.fromJson(jsonDecode(localTheme));
    }

    final videoRepository = Get.find<VideoCatalogRepository>();
    final response = await videoRepository.generalThemes();

    if (response.status == 'success') {
      data.value = response.data;
      await box.write(PreferencesKey.THEME_KEY, jsonEncode(response.data.toJson()));
    }
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
