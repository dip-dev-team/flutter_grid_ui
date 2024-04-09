import 'package:flutter/material.dart';
import 'package:flutter_flexui/flutter_flexui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});
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
                    styleXs:
                        TextStyle(fontWeight: FontWeight.w100, fontSize: 10),
                    styleSm:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                    styleMd:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    styleLg:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                  ),
                  FlexText(
                    '$_counter',
                    styleXs: const TextStyle(
                        fontWeight: FontWeight.w100, fontSize: 10),
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
              child: Text("FlexWidget",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Center(
              child: FlexWidget(
                xs: Container(
                  color: Colors.green,
                  width: 200.0,
                  height: 200.0,
                ),
                sm: Container(
                  color: Colors.orange,
                  width: 200.0,
                  height: 200.0,
                ),
                md: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 200.0,
                ),
                lg: Container(
                  color: Colors.purple,
                  width: 200.0,
                  height: 200.0,
                ),
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
              colXs: 1,
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
                FutureBuilder<DeviceType>(
                    future: context.deviceType,
                    builder: (context, snapshot) {
                      return Text(
                        "Device: ${snapshot.data?.toString()}",
                      );
                    }),
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
