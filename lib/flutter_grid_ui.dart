library flutter_grid_ui;

import 'package:dart_grid/dart_grid.dart';
import 'package:flutter/material.dart';

export 'package:dart_grid/dart_grid.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T? data);
typedef EmptyBuilder = Widget Function(BuildContext context);

/// A [GridWidget].
class GridWidget<T> extends StatefulWidget {
  final Grid<T> grid;
  //final ValueChanged<Grid<T>>? onChanged;
  final ItemBuilder<T> itemBuilder;
  final EmptyBuilder emptyBuilder;
  final ScrollController? verticalController;
  final ScrollController? horisontalController;

  const GridWidget(
      {super.key,
      required this.grid,
      /* this.onChanged, */ required this.itemBuilder,
      required this.emptyBuilder,
      this.verticalController,
      this.horisontalController});

  @override
  State<GridWidget<T>> createState() => _GridWidgetState<T>();
}

class _GridWidgetState<T> extends State<GridWidget<T>> {
  final _grid = Grid<T>();

  @override
  void initState() {
    super.initState();
    _grid.addAll(widget.grid);
  }

  @override
  void didUpdateWidget(covariant GridWidget<T> oldWidget) {
    if (oldWidget.grid != _grid) {
      setState(() {
        _grid.clear();
        _grid.addAll(widget.grid);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          controller: widget.horisontalController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
              controller: widget.verticalController,
              child: _grid.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: List<Widget>.generate(
                          _grid.lengthRows,
                          (indexRow) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                    _grid.lengthCells,
                                    (indexCell) => widget.itemBuilder.call(
                                        context,
                                        _grid
                                            .row(indexRow)
                                            .cell(indexCell)
                                            ?.data)),
                              )),
                    )
                  : widget.emptyBuilder(context))),
    );
  }
}
