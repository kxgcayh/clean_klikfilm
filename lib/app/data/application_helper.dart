import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';

extension ScrollControllerHelper on ScrollController {
  double get minOffset => position.minScrollExtent;
  double get maxOffset => position.maxScrollExtent;
  bool get isOutOfRange => position.outOfRange;

  bool get hasReachedTheEnd => offset >= maxOffset && !isOutOfRange;
  bool get hasReachedTheStart => offset <= minOffset && !isOutOfRange;
  bool get isScrolling => maxOffset > offset && minOffset < offset;
}

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

// extension BuildContextExt on BuildContext {
//   bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;
//   bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;
// }
