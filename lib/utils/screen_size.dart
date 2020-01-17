import 'package:flutter/widgets.dart';

class ScreenSize {
  /// @Screen.XS (for phones - screens less than 768px wide)
  /// @Screen.SM (for tablets - screens equal to or greater than 768px wide)
  /// @Screen.MD (for small laptops - screens equal to or greater than 992px wide)
  /// @Screen.LG (for laptops and desktops - screens equal to or greater than 1200px wide)
  static Screen screenSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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

  static int getMaxColumns(
    BuildContext context, {
    int colXS = 1,
    int colSm = 1,
    int colMd = 1,
    int colLg = 1,
  }) {
    switch (screenSize(context)) {
      case Screen.LG:
        return colLg;
        break;
      case Screen.MD:
        return colMd;
        break;
      case Screen.SM:
        return colSm;
        break;
      default:
        return colXS;
    }
  }

  static TextStyle getTextStyle(
    BuildContext context, {
    TextStyle styleXS,
    TextStyle styleSm,
    TextStyle styleMd,
    TextStyle styleLg,
  }) {
    switch (screenSize(context)) {
      case Screen.LG:
        return styleLg != null
            ? styleLg
            : styleLg != null ? styleMd : styleSm != null ? styleSm : styleXS;
        break;
      case Screen.MD:
        return styleMd != null
            ? styleMd
            : styleSm != null ? styleSm : styleXS != null ? styleXS : styleLg;
        break;
      case Screen.SM:
        return styleSm != null
            ? styleSm
            : styleXS != null ? styleXS : styleMd != null ? styleMd : styleLg;
        break;
      default:
        return styleXS != null
            ? styleXS
            : styleSm != null ? styleSm : styleMd != null ? styleMd : styleLg;
    }
  }

  static Widget getWidget(
    BuildContext context, {
    Widget xs,
    Widget sm,
    Widget md,
    Widget lg,
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
