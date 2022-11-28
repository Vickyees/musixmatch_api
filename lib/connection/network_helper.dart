import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:musixmatch_api/bloc/track_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        TrackBloc().add(const NetworkNotify());
      } else {
        TrackBloc().add(const NetworkNotify(isConnected: true));
      }
    });
  }
}
