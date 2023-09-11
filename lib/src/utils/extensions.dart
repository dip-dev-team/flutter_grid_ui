import 'dart:math';

import 'package:flutter/widgets.dart';

import 'screen.dart';

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

  /// Get Orientation
  Orientation get orientation => Screen.orientation(this);

  /// Width of Screen
  double get screenWidth => Screen.width(this);

  /// Height of Screen
  double get screenHeight => Screen.height(this);

  /// Get pixel ratio of screen
  double get pixelRatio => Screen.pixelRatio(this);

  /// Get aspect ratio of screen
  double get aspectRatio => Screen.aspectRatio(this);

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
  }) =>
      Screen.valueByScreen<T>(this, xs: xs, sm: sm, md: md, lg: lg);
}

extension NumExtension on num {
  /// The respective value in centimeters
  double get cm => this * 37.8;

  /// The respective value millimeters
  double get mm => this * 3.78;

  /// The respective value in quarter-millimeters
  double get q => this * 0.945;

  /// The respective value in inches
  double get inches => this * 96;

  /// The respective value in picas (1/6th of 1 inch)
  double get pc => this * 16;

  /// The respective value in points (1/72th of 1 inch)
  double get pt => this * inches / 72;

  /// The respective value in pixels (default)
  double get px => toDouble();

  /// Respective percentage of the viewport's smaller dimension.
  double vmin(BuildContext context) =>
      this * min(Screen.height(context), Screen.width(context)) / 100;

  /// Respective percentage of the viewport's larger dimension.
  double vmax(BuildContext context) =>
      this * max(Screen.height(context), Screen.width(context)) / 100;

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double percentHeight(BuildContext context) =>
      this * Screen.height(context) / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  double percentWidth(BuildContext context) =>
      this * Screen.width(context) / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's pixel
  /// density and aspect ratio
  double sp(BuildContext context) =>
      this *
      (((percentHeight(context) + percentWidth(context)) +
              (context.pixelRatio * context.aspectRatio)) /
          2.08) /
      100;

  /// Calculates the material dp (Pixel Density)
  double dp(BuildContext context) =>
      this * (percentWidth(context) * 160) / context.pixelRatio;

  /// Calculates the sp (Scalable Pixel) based
  double spa(BuildContext context) =>
      this *
      (((percentHeight(context) + percentWidth(context)) +
              (240 * context.aspectRatio)) /
          2.08) /
      100;
}
