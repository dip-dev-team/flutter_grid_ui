import 'package:flutter/widgets.dart';

import '../../flutter_flexui.dart';

class FlexBuilder extends StatelessWidget with Screen, Device {
  final Widget Function(BuildContext context, ScreenState screen) builder;

  const FlexBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DeviceType>(
      builder: (context, snapshot) {
        return builder(context, ScreenState(context, snapshot.data));
      },
      future: Device.deviceType(context),
    );
  }
}

class ScreenState {
  final BuildContext _context;
  final DeviceType? _deviceType;

  const ScreenState(this._context, this._deviceType);

  /// Get screen size
  /// @ScreenSize.xs (for phones - screens less than 768px wide)
  /// @ScreenSize.sm (for tablets - screens equal to or greater than 768px wide)
  /// @ScreenSize.md (for small laptops - screens equal to or greater than 992px wide)
  /// @ScreenSize.lg (for laptops and desktops and TV - biggers screens)
  ScreenSize get screenSize => Screen.screenSize(_context);

  /// Get MediaQueryData
  MediaQueryData get mediaQuery => Screen.mediaQuery(_context);

  /// Get Orientation
  Orientation get orientation => Screen.orientation(_context);

  /// Width of Screen
  double get screenWidth => Screen.width(_context);

  /// Height of Screen
  double get screenHeight => Screen.height(_context);

  /// Get pixel ratio of screen
  double get pixelRatio => Screen.pixelRatio(_context);

  /// Get aspect ratio of screen
  double get aspectRatio => Screen.aspectRatio(_context);

  /// Screen diagonal
  double get diagonal => Screen.diagonal(_context);

  /// Screen diagonal in inc
  double get diagonalInches => Screen.diagonalInches(_context);

  /// Get height of status bar
  double get statusBarHeight => Screen.statusBarHeight(_context);

  /// Get height of bottom bar
  double get bottomBarHeight => Screen.bottomBarHeight(_context);

  /// Get value by screen size
  T? valueByScreen<T extends Object>({
    T? xs,
    T? sm,
    T? md,
    T? lg,
  }) =>
      Screen.valueByScreen<T>(_context, xs: xs, sm: sm, md: md, lg: lg);

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

  /// Get true if Laptop
  bool get isLaptop => _deviceType == DeviceType.laptop;

  /// Get true if isTablet
  bool get isTablet => _deviceType == DeviceType.tablet;

  /// Get true if Mobile
  bool get isMobile => _deviceType == DeviceType.mobile;
}
