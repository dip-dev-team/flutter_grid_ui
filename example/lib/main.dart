import 'package:flutter/material.dart';
import 'package:flutter_flexui/flexui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _MyHomePageState();
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
                  const FlexText(
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
                    styleSm: const TextStyle(
                        fontWeight: FontWeight.w200, fontSize: 12),
                    styleMd: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                    styleLg: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 22),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("FlexRow",
                  style: Theme.of(context).textTheme.headlineMedium),
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
                Text("Width: ${context.screenWidth}"),
                Text("Height: ${context.screenHeight}"),
                Text("PixelRation: ${context.pixelRatio}"),
                Text("Diagonal: ${context.diagonalInches}"),
                Text(
                  "Screen: ${context.screenSize.toString()}",
                ),
                Text(
                  "Device: ${context.deviceType.toString()}",
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
