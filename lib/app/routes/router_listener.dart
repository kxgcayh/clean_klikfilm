import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerListenerProvider = AutoDisposeAsyncNotifierProvider<RouterListener, void>(() {
  return RouterListener();
});

class RouterListener extends AutoDisposeAsyncNotifier<void> implements Listenable {
  VoidCallback? _routerListener;

  @override
  Future<void> build() async {
    // trigger something when there is not connection
    // ref.listen(nameProvider, (previous, next) {});

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      _routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    return null;
  }

  @override
  void addListener(VoidCallback listener) => _routerListener = listener;

  @override
  void removeListener(VoidCallback listener) => _routerListener = null;
}
