library flexui;

import 'package:flutter/widgets.dart';
import 'package:flutter_flexui/utils/screen_size.dart';
export 'widgets/flex_row.dart';
export 'widgets/flex_text.dart';
export 'widgets/flex_widget.dart';

class FlexUI with ScreenSize {
  static bool isMobile(BuildContext context) {
    return ScreenSize.screenSize(context) == Screen.XS || ScreenSize.screenSize(context) == Screen.SM;
  }
}
