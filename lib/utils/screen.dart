import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_flexui/utils/device.dart';

class Screen {
  // Approximate Pixel Density
  static double get _ppi =>
      Device.isWeb ? 150 : Device.isAndroid || Device.isIOS ? 160 : 96;

  /// @ScreenSize.XS (for phones - screens less than 768px wide)
  /// @ScreenSize.SM (for tablets - screens equal to or greater than 768px wide)
  /// @ScreenSize.MD (for small laptops - screens equal to or greater than 992px wide)
  /// @ScreenSize.LG (for laptops and desktops - screens equal to or greater than 1200px wide)
  static ScreenSize screenSize(BuildContext context) {
    final screenWidth = Screen.width(context);
    final screenHeight = Screen.height(context);
    final value = screenWidth > screenHeight ? screenWidth : screenHeight;
    final diagonalInches = Screen.diagonalInches(context);

    if (diagonalInches >= 21.0 && value >= 1200.0) {
      return ScreenSize.LG;
    } else if (diagonalInches >= 11.0 && value >= 992.0) {
      return ScreenSize.MD;
    } else if (diagonalInches >= 8.0 && value >= 768.0) {
      return ScreenSize.SM;
    } else {
      return ScreenSize.XS;
    }
  }

  /// Get MediaQueryData
  static MediaQueryData mediaQuery(BuildContext context) =>
      MediaQuery.of(context);
  static Size size(BuildContext context) => mediaQuery(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;

  /// Get pixel ratio of screen
  static double pixelRatio(BuildContext context) =>
      Screen.mediaQuery(context).devicePixelRatio;

  /// Screen diagonal
  static double diagonal(BuildContext context) {
    Size s = size(context);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  static double diagonalInches(BuildContext context) =>
      diagonal(context) / _ppi;

  /// Get height of status bar
  static double statusBarHeight(BuildContext context) =>
      Screen.mediaQuery(context).padding.top;

  /// Get height of bottom bar
  static double bottomBarHeight(BuildContext context) =>
      Screen.mediaQuery(context).padding.bottom;

  /// Get value by screen size
  static T valueByScreen<T extends Object>(
    BuildContext context, {
    T xs,
    T sm,
    T md,
    T lg,
  }) {
    switch (screenSize(context)) {
      case ScreenSize.LG:
        return lg != null ? lg : md != null ? md : sm != null ? sm : xs;
        break;
      case ScreenSize.MD:
        return md != null ? md : sm != null ? sm : xs != null ? xs : lg;
        break;
      case ScreenSize.SM:
        return sm != null ? sm : xs != null ? xs : md != null ? md : lg;
        break;
      default:
        return xs != null ? xs : sm != null ? sm : md != null ? md : lg;
    }
  }
}

/// @ScreenSize
/// @ScreenSize.XS - for phones
/// @ScreenSize.SM  - tablets
/// @ScreenSize.MD  - for small laptops
/// @ScreenSize.LG  - for laptops and desktops
enum ScreenSize {
  XS,
  SM,
  MD,
  LG,
}

// Mobile
// Nexus S - 4` 480x800 (320x533.33, 1.5)
// Nexus 5x - 5.2` 1080x1920 (411.42x683.42, 2.625)
// Pixel 3 XL - 6.3` 1440x2960 (411.42x797.71, 3.5)

// Tablet
// Pixel C - 9.94` 2560x1800 (900x1224, 2)
// Nexus 7 - 7` 800x1280 (600.93x913.42, 1.3)

// Laptop web
// Xiaomi 13.3 notebook - 13.3` 1920x1024 (1920x979, 1)

// TV
// Android TV 1080p - 55` 1920x1080 (960x540, 2.0)
// Android TV 720p - 55` 1280x720 (961.50x540.84, 1.331)
// Fire Stick -
