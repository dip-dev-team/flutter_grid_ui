import 'package:flutter/material.dart';
import 'package:flutter_flexui/flexui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  FlexText(
                    'You have pushed the button this many times:',
                    styleSm:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                    styleMd:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    styleLg:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                  ),
                  FlexText(
                    '$_counter',
                    styleSm:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                    styleMd:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    styleLg:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text("FlexRow", style: Theme.of(context).textTheme.headline4),
            ),
            FlexRow(
              colLg: 6,
              colMd: 3,
              colSm: 2,
              colXS: 1,
              colMainAxisAlignment: MainAxisAlignment.spaceEvenly,
              colVerticalDirection: VerticalDirection.down,
              colMainAxisSize: MainAxisSize.max,
              rowMainAxisAlignment: MainAxisAlignment.spaceAround,
              rowVerticalDirection: VerticalDirection.down,
              rowMainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Width: ${Screen.width(context)}"),
                Text("Height: ${Screen.height(context)}"),
                Text("PixelRation: ${Screen.pixelRatio(context)}"),
                Text("Diagonal: ${Screen.diagonalInches(context)}"),
                Text(
                  "Screen: ${Screen.screenSize(context).toString()}",
                ),
                Text(
                  "Device: ${Device.deviceType(context).toString()}",
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
