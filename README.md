Flutter FlexUI
===============

Flutter package for build Flexible UI for diference screens

## Getting Started

To use this package, add `flutter_flexui` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  flutter_flexui: ^1.3.0
```

## Using

```dart
import 'package:flutter_flexui/flutter_flexui.dart';
```

### Example

#### FlexRow

```dart
  FlexRow(
    colLg: 6,
    colMd: 3,
    colSm: 1,
    colMainAxisAlignment: MainAxisAlignment.spaceEvenly,
    colVerticalDirection: VerticalDirection.down,
    colMainAxisSize: MainAxisSize.max,
    rowMainAxisAlignment: MainAxisAlignment.spaceAround,
    rowVerticalDirection: VerticalDirection.down,
    rowMainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Text('1'),
      Text('2'),
      Text('3'),
      Text('4'),
      Text('5'),
      ],
  );
```

#### FlexText

```dart
  FlexText(
    "Test",
    styleSm: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
    styleMd: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    styleLg: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
  );
```

#### FlexWidget

```dart
  FlexWidget(
    sm: Text("Small"),
    md: Text("Meddium"),
    lg: Text("Large"),
  );
```

#### FlexBuilder

```dart
  FlexBuilder(
      builder: (context, screen) {
        return Container();
      },
    );
```
### Utils

#### Screen

```dart
  /// Return @ScreenSize
  /// @ScreenSize.xs (for phones - screens less than 768px wide)
  /// @ScreenSize.sm (for tablets - screens equal to or greater than 768px wide)
  /// @ScreenSize.md (for small laptops - screens equal to or greater than 992px wide)
  /// @ScreenSize.lg (for laptops and desktops - screens equal to or greater than 1200px wide)
  context.screenSize;

  /// Get MediaQueryData
  context.mediaQuery;

  /// Get Orientation
  context.orientation;

  /// Width of Screen
  context.screenWidth;

  /// Height of Screen
  context.screenHeight;

  /// Get pixel ratio of screen
  context.pixelRatio;

  /// Screen diagonal
  context.diagonal;

  /// Screen diagonal in inc
  context.diagonalInches;

  /// Get height of status bar
  context.statusBarHeight;

  /// Get height of bottom bar
  context.bottomBarHeight;

  // Get value by screen size
  context.valueByScreen(xsObject, smObject, mdObject, lgObject);
```

#### Device

```dart
  context.isDesktop

  context.isTablet

  context.isMobile

  context.isWeb

  context.isWindows

  context.isLinux

  context.isMacOS

  context.isAndroid

  context.isFuchsia

  context.isIOS

  /// Get @DeviceType
  context.deviceType
```

## Authors

> This project developed by [**DipDev Studio**](https://dipdev.studio) Team: [@Dimoshka](https://www.linkedin.com/in/dmytroprylutskyi/)
