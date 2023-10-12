import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:image_compression_flutter/image_compression_flutter.dart';
// import 'package:sixam_mart/controller/splash_controller.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
