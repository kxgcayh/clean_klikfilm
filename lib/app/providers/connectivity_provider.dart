import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectivityStreamProvider = StreamProvider<List<ConnectivityResult>>((ref) async* {
  final Connectivity connectivity = Connectivity();
  yield* connectivity.onConnectivityChanged.asBroadcastStream();
});

final connectityNotifier = NotifierProvider<ConnectivityNotifier, ConnectivityResult>(
  () => ConnectivityNotifier(),
);

class ConnectivityNotifier extends Notifier<ConnectivityResult> {
  @override
  ConnectivityResult build() {
    return ConnectivityResult.none;
  }

  void change(ConnectivityResult value) => state = value;
}
