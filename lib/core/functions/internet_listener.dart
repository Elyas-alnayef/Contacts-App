import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkNetworkConnection() async {
  bool? isConnected;
  var status = await Connectivity().checkConnectivity();
    if (status.contains(ConnectivityResult.wifi) ||
        status.contains(ConnectivityResult.mobile)) {
      isConnected = true;
    } else {
      isConnected = false;
    }

  print(isConnected);
  return isConnected ;
}
