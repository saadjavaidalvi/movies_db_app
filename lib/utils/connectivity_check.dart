import 'package:connectivity_plus/connectivity_plus.dart';

class MyConnection {
  Future<bool> isConnected() async {
    ConnectivityResult connected = await Connectivity().checkConnectivity();
    if (connected.index == ConnectivityResult.wifi.index ||
        connected.index == ConnectivityResult.mobile.index) {
      return true;
    }

    return false;
  }
}
