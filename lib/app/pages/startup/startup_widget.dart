import 'package:fl_klikfilm/app/pages/startup/startup_error_widget.dart';
import 'package:fl_klikfilm/app/pages/startup/startup_loading_widget.dart';
import 'package:fl_klikfilm/app/providers/app_startup_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class AppStartupWidget extends ConsumerWidget {
  final WidgetBuilder onLoaded;
  const AppStartupWidget({super.key, required this.onLoaded});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      loading: () => StartupLoadingWidget(),
      error: (error, stackTrace) => AppStartupErrorPage(
        error: error,
        onRetry: () {
          klog.e('failed', error: error);
          ref.invalidate(appStartupProvider);
        },
      ),
      data: (_) => onLoaded(context),
    );
  }
}
