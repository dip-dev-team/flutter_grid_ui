# flutter_flexui

Flutter package for build Flexible UI for diference screens

## Getting Started

To use this package, add `flutter_flexui` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  flutter_flexui: ^0.0.1
```

### Example

#### Main function

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: FlexRow(
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
            Text("3"),
            Text("4"),
            Text("5"),
          ],
        ),
      ),
    );
  }
```

### Authors

```
This project developed by DipDev Studio Team: @Dimoshka
```