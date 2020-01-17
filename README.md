# flutter_flexui

Flutter package for build Flexible UI for diference screens

## Getting Started

To use this package, add `flutter_flexui` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  flutter_flexui: ^0.0.3
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
      Text('5'),],);
```

#### FlexText

```dart
  FlexText(
    "Test",
    styleSm: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
    styleMd: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    styleLg: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),);
```

#### FlexWidget

```dart
  FlexWidget(
    sm: Text("Small"),
    md: Text("Meddium"),
    lg: Text("Large"),);
```

## Authors

```
This project developed by DipDev Studio Team: @Dimoshka
```