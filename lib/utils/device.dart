// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

// Project imports:
import 'package:flutter_flexui/utils/screen.dart';

/// Device extension for context
/// Like context.isDesktop
extension DeviceExtension on BuildContext {
  /// Get true if Web
  bool get isWeb => Device.isWeb;

  /// Get true if Windows
  bool get isWindows => Device.isWindows;

  /// Get true if Linux
  bool get isLinux => Device.isLinux;

  /// Get true if MacOS
  bool get isMacOS => Device.isMacOS;

  /// Get true if Android
  bool get isAndroid => Device.isAndroid;

  /// Get true if Fuchsia
  bool get isFuchsia => Device.isFuchsia;

  /// Get true if iOS
  bool get isIOS => Device.isIOS;

  /// Get true if Desktop
  bool get isDesktop => Device.isDesktop;

  /// Get true if Mobile
  Future<bool> get isMobile => Device.isMobile(this);

  /// Get @DeviceType
  /// @DeviceType.MOBILE
  /// @DeviceType.TABLET
  /// @DeviceType.LAPTOP
  /// @DeviceType.TV
  /// @DeviceType.UNKNOWN
  Future<DeviceType> get deviceType => Device.deviceType(this);

  /// Get @TVDeviceType
  /// @TVDeviceType.TIZEN
  /// @TVDeviceType.WEBOS
  /// @TVDeviceType.ANDROIDTV
  /// @TVDeviceType.FIRETV
  /// @TVDeviceType.MITV
  /// @DeviceType.UNKNOWN
  Future<TVDeviceType> get tvDeviceType => Device.tvDeviceType(this);
}

// Device utils
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
      final appVersion = html.window.navigator.appVersion.toUpperCase();
      if (appVersion.contains('TIZEN') ||
          appVersion.contains('WEBOS') ||
          appVersion.contains('BOX') ||
          appVersion.contains('TV')) {
        return DeviceType.TV;
      } else if (isWindows || isLinux || isMacOS) {
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

  /// Get @TVDeviceType
  /// @TVDeviceType.TIZEN
  /// @TVDeviceType.WEBOS
  /// @TVDeviceType.ANDROIDTV
  /// @TVDeviceType.FIRETV
  /// @TVDeviceType.MITV
  /// @DeviceType.UNKNOWN
  static Future<TVDeviceType> tvDeviceType(BuildContext context) async {
    final deviceType = await Device.deviceType(context);
    if (deviceType == DeviceType.TV) {
      if (isWeb) {
        final appVersion = html.window.navigator.appVersion.toUpperCase();
        if (appVersion.contains('TIZEN')) {
          return TVDeviceType.TIZEN;
        } else if (appVersion.contains('WEBOS')) {
          return TVDeviceType.WEBOS;
        }
      } else if (isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        if (isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          final model = androidInfo.model.toUpperCase();
          if (model.contains('AFT')) {
            return TVDeviceType.FIRETV;
          } else if (model.contains('BOX')) {
            return TVDeviceType.MITV;
          } else if (model.contains('TV')) {
            return TVDeviceType.ANDROIDTV;
          }
        }
      }
    }
    return TVDeviceType.UNKNOWN;
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

/// @TVDeviceType
enum TVDeviceType {
  TIZEN,
  WEBOS,
  ANDROIDTV,
  FIRETV,
  MITV,
  UNKNOWN,
}
