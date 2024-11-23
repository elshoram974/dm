import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/locale/generated/l10n.dart';
import '../functions/show_my_snack_bar.dart';

class NetworkInfo {
  const NetworkInfo();

  static final List<ConnectivityResult> _results = [];

  static Future<void> init() async {
    _results.addAll(await Connectivity().checkConnectivity());
    checkConnectivity();
  }

  static bool get isConnected {
    if (_results.isEmpty) {
      Connectivity().checkConnectivity().then(
        (result) {
          _results.clear();
          _results.addAll(result);
          _networkMethod();
        },
      );
    }
    return !_results.contains(ConnectivityResult.none);
  }

  static void checkConnectivity() {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        _results.clear();
        _results.addAll(result);
        _networkMethod();
      },
    );
  }

  static bool _whenOpenApp = true;
  static void _networkMethod() {
    if (_whenOpenApp) {
      _whenOpenApp = false;
      return;
    }
    if (isConnected) {
      ShowMySnackBar.call(
        S.current.connectedToInternet,
        backgroundColor: Colors.green,
      );
    } else {
      ShowMySnackBar.call(
        S.current.noInternetConnection,
        backgroundColor: Get.theme.colorScheme.error,
      );
    }
  }

  /// This getter returns true if no internet connection,
  /// and will show snackbar that return no internet connection
  static bool get showSnackBarWhenNoInternet {
    if (isConnected) return false;
    ShowMySnackBar.call(
      S.current.noInternetConnection,
      backgroundColor: Get.theme.colorScheme.error,
    );
    return true;
  }
}
