import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:drm_info/drm_info.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class ThemingController extends GetxController {
  final data = AppThemeData().obs;
  final RxBool canSurfaceView = true.obs;

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
    if (Platform.isAndroid) {
      final DrmInfo drmInfoPlugin = DrmInfo();
      final securityLevel = await drmInfoPlugin.getWidevineSecurityLevel();
      canSurfaceView.value = securityLevel != 'L3';
    }
    super.onInit();
  }

  Color get backgroundColor => HexColor(data.value.general.background.color);
}
