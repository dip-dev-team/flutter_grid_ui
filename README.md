Flutter FlexUI
===============

Flutter package for build Flexible UI for diference screens

## Getting Started

To use this package, add `flutter_flexui` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  flutter_flexui: ^0.1.4
```

## Using

```dart
import 'package:flutter_flexui/flexui.dart';
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

### Utils

#### Screen

```dart
  /// Return @ScreenSize
  /// @ScreenSize.XS (for phones - screens less than 768px wide)
  /// @ScreenSize.SM (for tablets - screens equal to or greater than 768px wide)
  /// @ScreenSize.MD (for small laptops - screens equal to or greater than 992px wide)
  /// @ScreenSize.LG (for laptops and desktops - screens equal to or greater than 1200px wide)
  Screen.screenSize(context);
```

```dart
  /// Get MediaQueryData
  Screen.mediaQuery(context);
```

```dart
  Screen.size(context);
```

```dart
  Screen.width(context);
```

```dart
  Screen.height(context);
```

```dart
  /// Get pixel ratio of screen
  Screen.pixelRatio(context);
```

```dart
  /// Screen diagonal
  Screen.diagonal(context);
```

```dart
  Screen.diagonalInches(context);
```

```dart
  Screen.statusBarHeight(context);
```

```dart
  Screen.bottomBarHeight(context);
```

```dart
  // Get value by screen size
  Screen.valueByScreen(context, xsObject, smObject, mdObject, lgObject);
```

#### Device

```dart
   Device.isDesktop
```

```dart
  Device.isMobile
```

```dart
  Device.isWeb
```

```dart
  Device.isWindows
```

```dart
  Device.isLinux
```

```dart
  Device.isMacOS
```

```dart
  Device.isAndroid
```

```dart
  Device.isFuchsia
```

```dart
  Device.isIOS
```

```dart
  /// Get @DeviceType
  Device.deviceType(context)
```

## Authors

> This project developed by [**DipDev Studio**](https://dipdev.studio) Team: [@Dimoshka](https://www.linkedin.com/in/dmytroprylutskyi/)