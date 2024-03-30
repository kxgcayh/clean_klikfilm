import 'dart:async';

import 'package:fl_klikfilm/app/providers/banner/banner_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

part 'banner_notifier_provider.p.dart';

final bannerNotifierProvider = AsyncNotifierProvider<BannerNotifier, BannerState>(
  () => BannerNotifier(),
);
