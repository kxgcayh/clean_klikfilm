import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:drm_info/drm_info.dart';
import 'package:fl_klikfilm/app/data/application_helper.dart';
import 'package:fl_klikfilm/app/data/third_party_provider.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class LocalUserController extends GetxService {
  final Rx<CommonUserData> common = CommonUserData().obs;
  final Rx<UserAuthData> authentication = UserAuthData().obs;
  final RxBool canSurfaceView = true.obs;

  @override
  Future<void> onInit() async {
    FlutterNativeSplash.remove();
    final _box = GetSecureStorage(password: 'strongpassword');

    final authBox = _box.read(PreferencesKey.AUTH_USER_KEY);
    final commonBox = _box.read(PreferencesKey.COMMON_USER);
    if (commonBox != null) common.value = CommonUserData.fromJson(jsonDecode(commonBox));
    if (authBox != null) authentication.value = UserAuthData.fromJson(jsonDecode(authBox));

    final ThirdPartyProvider thirdParty = Get.find<ThirdPartyProvider>();
    final network = await thirdParty.networkDetail();
    common.value = common.value.copyWith(countryCode: network?.countryCode ?? 'USA');

    if (authentication.value.userId.isEmpty) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      authentication.value = authentication.value.copyWith(
        userId: ApiCredentials.generateUid(deviceInfo.getUserAgent()),
      );
    }

    if (authentication.value.accessToken.isEmpty) {
      final videoRepository = Get.find<VideoCatalogRepository>();
      final accessTokenResponse = await videoRepository.accessToken(uid: authentication.value.userId);
      if (accessTokenResponse.data?.token != null) {
        authentication.value = authentication.value.copyWith(
          accessToken: '${accessTokenResponse.data?.token}',
        );
      }
    }

    if (Platform.isAndroid) {
      final DrmInfo drmInfoPlugin = DrmInfo();
      final securityLevel = await drmInfoPlugin.getWidevineSecurityLevel();
      canSurfaceView.value = securityLevel != 'L3';
    }

    await _box.write(PreferencesKey.AUTH_USER_KEY, jsonEncode(authentication.value.toJson()));
    await _box.write(PreferencesKey.COMMON_USER, jsonEncode(common.value.toJson()));
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
