import 'package:hooks_riverpod/hooks_riverpod.dart';

final FutureProvider<void> appStartupProvider = FutureProvider<void>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  ref.onDispose(() {
    // ensure dependent providers are disposed as well
  });
  // await for all initialization code to be complete before returning
});
