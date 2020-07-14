import 'package:device_info/device_info.dart';
import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flexui/utils/screen.dart';

class Device {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isWeb => kIsWeb;

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;

  static Future<bool> isMobile(BuildContext context) async {
    return await deviceType(context) == DeviceType.MOBILE;
  }

  /// Get @DeviceType
  /// @DeviceType.MOBILE
  /// @DeviceType.TABLET
  /// @DeviceType.LAPTOP
  /// @DeviceType.TV
  /// @DeviceType.UNKNOWN
  static Future<DeviceType> deviceType(BuildContext context) async {
    final screenSize = Screen.screenSize(context);
    if (isWeb) {
      if (isWindows || isLinux || isMacOS) {
        return DeviceType.LAPTOP;
      } else if (screenSize == ScreenSize.XS) {
        return DeviceType.MOBILE;
      } else if (screenSize == ScreenSize.SM) {
        return DeviceType.TABLET;
      } else if (screenSize == ScreenSize.MD) {
        return DeviceType.LAPTOP;
      } else if (screenSize == ScreenSize.LG) {
        return DeviceType.TV;
      } else {
        return DeviceType.UNKNOWN;
      }
    } else if (isDesktop) {
      return DeviceType.LAPTOP;
    } else if (isAndroid || isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        final model = androidInfo.model.toUpperCase();
        if (model.contains('AFT') ||
            model.contains('BOX') ||
            model.contains('TV')) {
          return DeviceType.TV;
        }
        debugPrint(androidInfo.toString());
      } else if (isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        debugPrint(iosInfo.toString());
      }
      if (screenSize == ScreenSize.XS) {
        return DeviceType.MOBILE;
      } else if (screenSize == ScreenSize.SM) {
        return DeviceType.TABLET;
      } else if (screenSize == ScreenSize.MD || screenSize == ScreenSize.LG) {
        return DeviceType.TV;
      } else {
        return DeviceType.UNKNOWN;
      }
    } else {
      return DeviceType.UNKNOWN;
    }
  }
}

/// @DeviceType
enum DeviceType {
  MOBILE,
  TABLET,
  LAPTOP,
  TV,
  UNKNOWN,
}
