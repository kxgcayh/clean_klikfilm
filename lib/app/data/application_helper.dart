import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension DeviceInfoHelper on BaseDeviceInfo {
  String getUserAgent() {
    if (this is AndroidDeviceInfo) {
      final AndroidDeviceInfo data = this as AndroidDeviceInfo;
      return '${data.brand},${data.device},${data.manufacturer},${data.model},${data.product},${data.hardware},${data.version.codename}';
    }
    if (this is IosDeviceInfo) {
      final IosDeviceInfo data = this as IosDeviceInfo;
      return '${data.name},${data.systemName},${data.systemName},${data.systemVersion}';
    }
    return '$hashCode';
  }
}

extension BuildContextExt on BuildContext {
  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;
  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;
}
