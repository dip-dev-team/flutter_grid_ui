import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flexui/utils/screen.dart';

class Device {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => !isWeb && (isAndroid || isIOS);
  static bool get isWeb => kIsWeb;

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;

  /// Get @DeviceType
  static DeviceType deviceType(BuildContext context) {
    final screenSize = Screen.screenSize(context);
    if (isWeb) {
      if (screenSize == ScreenSize.XS) {
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
    } else if (isAndroid || isIOS || isFuchsia) {
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
