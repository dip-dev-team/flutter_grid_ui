
library flutter_grid_ui;

import 'package:dart_grid/dart_grid.dart';
import 'package:flutter/material.dart';

export 'package:dart_grid/dart_grid.dart';

typedef CellBuilder<T> = Widget Function(BuildContext context, T data);

/// A [GridWidget].
class GridWidget<T> extends StatefulWidget {
  final Grid<T> grid;
  final ValueChanged<Grid<T>>? onChanged;
  final CellBuilder<T> builder;

  const GridWidget(
      {super.key, required this.grid, this.onChanged, required this.builder});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
