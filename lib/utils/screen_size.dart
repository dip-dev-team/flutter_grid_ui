import 'package:flutter/widgets.dart';

class ScreenSize {
  /// @Screen.XS (for phones - screens less than 768px wide)
  /// @Screen.SM (for tablets - screens equal to or greater than 768px wide)
  /// @Screen.MD (for small laptops - screens equal to or greater than 992px wide)
  /// @Screen.LG (for laptops and desktops - screens equal to or greater than 1200px wide)
  static Screen screenSize(BuildContext context) {
    double screenWidth = ScreenSize.getMediaQuery(context).size.width;
    if (screenWidth >= 1200) {
      return Screen.LG;
    } else if (screenWidth >= 992) {
      return Screen.MD;
    } else if (screenWidth >= 768) {
      return Screen.SM;
    } else {
      return Screen.XS;
    }
  }

  // Get height of status bar
  static double statusBarHeight(BuildContext context) {
    return ScreenSize.getMediaQuery(context).padding.top;
  }

  // Get height of bottom bar
  static double bottomBarHeight(BuildContext context) {
    return ScreenSize.getMediaQuery(context).padding.bottom;
  }

  // Get pixel ratio of screen
  static double pixelRatio(BuildContext context) {
    return ScreenSize.getMediaQuery(context).devicePixelRatio;
  }

  // Get value by screen size
  static T getValueByScreen<T extends Object>(
    BuildContext context, {
    T xs,
    T sm,
    T md,
    T lg,
  }) {
    switch (screenSize(context)) {
      case Screen.LG:
        return lg != null ? lg : md != null ? md : sm != null ? sm : xs;
        break;
      case Screen.MD:
        return md != null ? md : sm != null ? sm : xs != null ? xs : lg;
        break;
      case Screen.SM:
        return sm != null ? sm : xs != null ? xs : md != null ? md : lg;
        break;
      default:
        return xs != null ? xs : sm != null ? sm : md != null ? md : lg;
    }
  }

  static MediaQueryData getMediaQuery(BuildContext context) {
    return MediaQuery.of(context);
  }
}

/// @Screen.XS - for phones
/// @Screen.SM  - tablets
/// @Screen.MD  - for small laptops
/// @Screen.LG  - for laptops and desktops
enum Screen {
  XS,
  SM,
  MD,
  LG,
}
