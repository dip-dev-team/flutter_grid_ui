import 'package:flutter/material.dart';
import 'package:flutter_grid_ui/flutter_grid_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _grid = Grid<int>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridWidget(
        grid: _grid,
        builder: (context, data) {
          return Container(
            padding: const EdgeInsets.all(8),
            width: 200.0,
            height: 100.0,
          );
        },
      ),
    );
  }
}
