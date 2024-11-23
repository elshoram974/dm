import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

abstract final class DeviceInfoHelper {
  const DeviceInfoHelper();

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.data;
    }

    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.data;
  }

  static Future<String> deviceInfoJson() async {
    Map<String, dynamic> deviceInfo = await getDeviceInfo();
    return json.encode(deviceInfo);
  }
}
