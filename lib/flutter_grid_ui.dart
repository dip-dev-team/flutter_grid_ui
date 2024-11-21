library;

import 'package:dart_grid/dart_grid.dart';
import 'package:flutter/material.dart';

export 'package:dart_grid/dart_grid.dart';

/// Widget builder callback with data
typedef ItemBuilder<T> = Widget Function(
    BuildContext context, T? data, int rowIndex, int cellIndex);

/// Widget builder callback
typedef EmptyBuilder = Widget Function(
    BuildContext context, int rowIndex, int cellIndex);

/// A [GridWidget] - UI implementation for [dart_grid].
class GridWidget<T> extends StatefulWidget {
  final Grid<T> grid;
  final ItemBuilder<T> itemBuilder;
  final EmptyBuilder emptyBuilder;
  final EmptyBuilder? outerBuilder;
  final ScrollController? verticalController;
  final ScrollController? horisontalController;

  const GridWidget(
      {super.key,
      required this.grid,
      required this.itemBuilder,
      required this.emptyBuilder,
      this.outerBuilder,
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
              child: AnimatedContainer(
                duration: const Duration(microseconds: 400),
                child: _grid.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.outerBuilder != null)
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List<Widget>.generate(
                                    _grid.lengthCells + 2,
                                    (cellIndex) => _grid.hasData(
                                            0, cellIndex - 1)
                                        ? widget.emptyBuilder
                                            .call(context, -1, cellIndex - 1)
                                        : widget.outerBuilder!
                                            .call(context, -1, cellIndex - 1))),
                          ...List<Widget>.generate(
                              _grid.lengthRows,
                              (rowIndex) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (widget.outerBuilder != null)
                                        _grid.hasData(rowIndex, 0)
                                            ? widget.emptyBuilder
                                                .call(context, rowIndex, -1)
                                            : widget.outerBuilder!
                                                .call(context, rowIndex, -1),
                                      ...List<Widget>.generate(
                                          _grid.lengthCells,
                                          (cellIndex) =>
                                              _grid.hasData(rowIndex, cellIndex)
                                                  ? widget.itemBuilder.call(
                                                      context,
                                                      _grid
                                                          .row(rowIndex)
                                                          ?.cell(cellIndex)
                                                          ?.data,
                                                      rowIndex,
                                                      cellIndex)
                                                  : widget.emptyBuilder.call(
                                                      context,
                                                      rowIndex,
                                                      cellIndex)),
                                      _grid.hasData(
                                              rowIndex, _grid.lengthCells - 1)
                                          ? widget.emptyBuilder.call(context,
                                              rowIndex, _grid.lengthCells)
                                          : widget.outerBuilder!.call(context,
                                              rowIndex, _grid.lengthCells),
                                    ],
                                  )),
                          if (widget.outerBuilder != null)
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List<Widget>.generate(
                                    _grid.lengthCells + 2,
                                    (cellIndex) => _grid.hasData(
                                            _grid.lengthRows - 1, cellIndex - 1)
                                        ? widget.emptyBuilder.call(context,
                                            _grid.lengthRows, cellIndex - 1)
                                        : widget.outerBuilder!.call(context,
                                            _grid.lengthRows, cellIndex - 1))),
                        ],
                      )
                    : widget.emptyBuilder.call(context, 0, 0),
              ))),
    );
  }
}
