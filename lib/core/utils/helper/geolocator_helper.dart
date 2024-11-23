import 'package:geolocator/geolocator.dart';

import '../config/locale/generated/l10n.dart';
import '../functions/show_my_snack_bar.dart';
import 'permission_helper.dart';

abstract final class GeolocatorHelper {
  const GeolocatorHelper();
  static final GeolocatorPlatform _geolocatorPlatform =
      GeolocatorPlatform.instance;

  static Future<Position?> handlePermission() async {
    if (await PermissionHelper.checkLocation()) {
      if (await Geolocator.isLocationServiceEnabled()) {
        try {
          final Position position =
              await _geolocatorPlatform.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.best,
            ),
          );
          return position;
        } catch (e) {
          if (e
              .toString()
              .contains("The location service on the device is disabled.")) {
            if (await _checkLocationEnabled()) return handlePermission();
          }
        }
      } else {
        if (await _checkLocationEnabled()) {
          _geolocatorPlatform.openLocationSettings();
        }
      }
    }
    return null;
  }

  static Future<bool> _checkLocationEnabled() async {
    bool isPressedEnable = false;
    final x = ShowMySnackBar.reRequestPermissionToast(
      text: S.current.locationServiceDisabled,
      actionText: S.current.enableService,
      onPressed: () {
        isPressedEnable = true;
      },
    );
    await x.closed;
    return isPressedEnable;
  }
}
