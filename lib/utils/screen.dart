import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;

import 'device.dart';

/// Screen extension for context
/// Like context.screenWidth()
extension ScreenExtension on BuildContext {
  /// Get screen size
  /// @ScreenSize.xs (for phones - screens less than 768px wide)
  /// @ScreenSize.sm (for tablets - screens equal to or greater than 768px wide)
  /// @ScreenSize.md (for small laptops - screens equal to or greater than 992px wide)
  /// @ScreenSize.lg (for laptops and desktops and TV - biggers screens)
  ScreenSize get screenSize => Screen.screenSize(this);

  /// Get MediaQueryData
  MediaQueryData get mediaQuery => Screen.mediaQuery(this);

  /// Width of Screen
  double get screenWidth => Screen.width(this);

  /// Height of Screen
  double get screenHeight => Screen.height(this);

  /// Get pixel ratio of screen
  double get pixelRatio => Screen.pixelRatio(this);

  /// Screen diagonal
  double get diagonal => Screen.diagonal(this);

  /// Screen diagonal in inc
  double get diagonalInches => Screen.diagonalInches(this);

  /// Get height of status bar
  double get statusBarHeight => Screen.statusBarHeight(this);

  /// Get height of bottom bar
  double get bottomBarHeight => Screen.bottomBarHeight(this);

  /// Get value by screen size
  T? valueByScreen<T extends Object>({
    T? xs,
    T? sm,
    T? md,
    T? lg,
  }) {
    return Screen.valueByScreen<T>(this, xs: xs, sm: sm, md: md, lg: lg);
  }
}

// Screen utils
/// Tested on:
/// Mobile
///// Nexus S - 4` 480x800 (320x533.33, 1.5)
///// Nexus 5x - 5.2` 1080x1920 (411.42x683.42, 2.625)
///// Pixel 3 XL - 6.3` 1440x2960 (411.42x797.71, 3.5)
/// Tablet
///// Pixel C - 9.94` 2560x1800 (900x1224, 2)
///// Nexus 7 - 7` 800x1280 (600.93x913.42, 1.3)
///// Laptop web
///// Xiaomi 13.3 notebook - 13.3` 1920x1024 (1920x979, 1)
/// TV
///// Android TV 1080p - 55` 1920x1080 (960x540, 2.0)
///// Android TV 720p - 55` 1280x720 (961.50x540.84, 1.331)
///// Fire Stick
mixin class Screen {
  /// Approximate Pixel Density
  static double get _ppi => Device.isWeb
      ? 150
      : Device.isAndroid || Device.isIOS
          ? 160
          : 96;

  /// Get screen size
  /// @ScreenSize.xs (for phones - screens less than 768px wide)
  /// @ScreenSize.sm (for tablets - screens equal to or greater than 768px wide)
  /// @ScreenSize.md (for small laptops - screens equal to or greater than 992px wide)
  /// @ScreenSize.lg (for laptops and desktops and TV - biggers screens)
  static ScreenSize screenSize(BuildContext context) {
    if (Device.isWeb) {
      final appVersion = html.window.navigator.appVersion.toUpperCase();
      if (appVersion.contains('TIZEN') ||
          appVersion.contains('WEBOS') ||
          appVersion.contains('BOX') ||
          appVersion.contains('TV')) {
        return ScreenSize.lg;
      }
    }

    final longestSide = Screen.longestSide(context);
    final diagonalInches = Screen.diagonalInches(context);

    if (diagonalInches >= 21.0 && longestSide >= 1200.0) {
      return ScreenSize.lg;
    } else if (diagonalInches >= 11.0 && longestSide >= 992.0) {
      return ScreenSize.md;
    } else if (diagonalInches >= 8.0 && longestSide >= 768.0) {
      return ScreenSize.sm;
    } else {
      return ScreenSize.xs;
    }
  }

  /// Get MediaQueryData
  static MediaQueryData mediaQuery(BuildContext context) =>
      MediaQuery.of(context);

  /// Size of Screen
  static Size size(BuildContext context) => mediaQuery(context).size;

  /// Width of Screen
  static double width(BuildContext context) => size(context).width;

  /// Height of Screen
  static double height(BuildContext context) => size(context).height;

  /// Longest Side of Screen
  static double longestSide(BuildContext context) => size(context).longestSide;

  /// Get pixel ratio of screen
  static double pixelRatio(BuildContext context) =>
      Screen.mediaQuery(context).devicePixelRatio;

  /// Screen diagonal
  static double diagonal(BuildContext context) {
    Size s = size(context);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Screen diagonal in inc
  static double diagonalInches(BuildContext context) =>
      diagonal(context) / _ppi;

  /// Get height of status bar
  static double statusBarHeight(BuildContext context) =>
      Screen.mediaQuery(context).padding.top;

  /// Get height of bottom bar
  static double bottomBarHeight(BuildContext context) =>
      Screen.mediaQuery(context).padding.bottom;

  /// Get value by screen size
  static T? valueByScreen<T extends Object>(
    BuildContext context, {
    T? xs,
    T? sm,
    T? md,
    T? lg,
  }) {
    switch (screenSize(context)) {
      case ScreenSize.lg:
        return lg ?? md ?? sm ?? xs;
      case ScreenSize.md:
        return md ?? sm ?? xs ?? lg;
      case ScreenSize.sm:
        return sm ?? xs ?? md ?? lg;
      default:
        return xs ?? sm ?? md ?? lg;
    }
  }
}

/// @ScreenSize
/// @ScreenSize.xs - for phones
/// @ScreenSize.sm  - tablets
/// @ScreenSize.md  - for small laptops
/// @ScreenSize.lg  - for laptops and desktops and TV
enum ScreenSize {
  xs,
  sm,
  md,
  lg,
}
