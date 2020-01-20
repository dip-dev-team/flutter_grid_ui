import 'package:flutter/widgets.dart';
import 'package:flutter_flexui/utils/screen_size.dart';

class FlexWidget extends StatelessWidget with ScreenSize {
  final Widget xs;
  final Widget sm;
  final Widget md;
  final Widget lg;

  const FlexWidget({Key key, this.xs, this.sm, this.md, this.lg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ScreenSize.getValueByScreen(context,
          xs: xs, sm: sm, md: md, lg: lg);
    });
  }
}
