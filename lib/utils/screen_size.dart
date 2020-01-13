import 'package:flutter/widgets.dart';

class ScreenSize {
  /* final BuildContext context;

  ScreenSize(this.context);

  Screen get screen {
    return screenSize(this.context);
  } */

  /// @Screen.XS (for phones - screens less than 768px wide)
  /// @Screen.SM (for tablets - screens equal to or greater than 768px wide)
  /// @Screen.MD (for small laptops - screens equal to or greater than 992px wide)
  /// @Screen.LG (for laptops and desktops - screens equal to or greater than 1200px wide)
  Screen screenSize(BuildContext context) {
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

  int getMaxColumns(
    BuildContext context, {
    int xs = 1,
    int sm = 1,
    int md = 1,
    int lg = 1,
  }) {
    switch (screenSize(context)) {
      case Screen.LG:
        return lg;
        break;
      case Screen.MD:
        return md;
        break;
      case Screen.SM:
        return sm;
        break;
      default:
        return xs;
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
