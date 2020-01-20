Flutter FlexUI
===============

Flutter package for build Flexible UI for diference screens

## Getting Started

To use this package, add `flutter_flexui` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  flutter_flexui: ^0.1.0
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

#### ScreenSize

```dart
  /// @Screen.XS (for phones - screens less than 768px wide)
  /// @Screen.SM (for tablets - screens equal to or greater than 768px wide)
  /// @Screen.MD (for small laptops - screens equal to or greater than 992px wide)
  /// @Screen.LG (for laptops and desktops - screens equal to or greater than 1200px wide)
  ScreenSize.screenSize(context);
```

```dart
  // Get height of status bar
  ScreenSize.statusBarHeight(context);
```

```dart
  // Get height of bottom bar
  ScreenSize.bottomBarHeight(context);
```

```dart
  // Get pixel ratio of screen
  ScreenSize.pixelRatio(context);
```

```dart
  // Get value by screen size
  ScreenSize.getValueByScreen(context, xsObject, smObject, mdObject, lgObject);
```

#### FlexUI

```dart
  // Returns true if the screen size is similar to a mobile device
  FlexUI.isMobile(context);
```

## Authors

> This project developed by [**DipDev Studio**](https://dipdev.studio) Team: [@Dimoshka](https://www.linkedin.com/in/dmytroprylutskyi/)