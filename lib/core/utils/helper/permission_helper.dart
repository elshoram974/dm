import 'package:permission_handler/permission_handler.dart';

import '../config/locale/generated/l10n.dart';
import '../functions/show_my_snack_bar.dart';

abstract final class PermissionHelper {
  const PermissionHelper();

  static Future<bool> checkLocation() async {
    const Permission permission = Permission.location;

    if ((await permission.status).isGranted) return true;

    final PermissionStatus status = await permission.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      ShowMySnackBar.reRequestPermissionToast(
        text: S.current.requestLocationPermission,
        actionText: S.current.grantLocationAccess,
        onPressed: openAppSettings,
      );
    } else {
      ShowMySnackBar.reRequestPermissionToast(
        text: S.current.requestLocationPermission,
        actionText: S.current.grantLocationAccess,
        onPressed: permission.request,
      );
    }
    return false;
  }
}
