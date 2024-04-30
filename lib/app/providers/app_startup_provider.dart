import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_klikfilm/app/providers/connectivity_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final FutureProvider<void> appStartupProvider = FutureProvider<void>((ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
  });

  ref.listen(connectivityStreamProvider, (previous, next) {
    final List<ConnectivityResult>? result = next.value;
    if (result != null && result.isNotEmpty) {
      final ConnectivityResult connection = result.first;
      ref.read(connectityNotifier.notifier).change(connection);
    }
  });

  await ref.watch(sharedPreferencesProvider.future);
  final videoRepository = ref.read(videoCatalogRepositoryProvider);
  final localNotifier = ref.read(localUserNotifierProvider.notifier);
  await localNotifier.updateCountryCode();
  await localNotifier.updateUserAgent();
  await localNotifier.updateUserId();
  final accessTokenResponse = await videoRepository.accessToken(
    uid: ref.read(localUserNotifierProvider.select((value) => value.userId)),
  );
  if (accessTokenResponse.data?.token != null) {
    await localNotifier.updateAccessToken('${accessTokenResponse.data?.token}');
  }
  await Future.delayed(Duration(seconds: 1));
});
