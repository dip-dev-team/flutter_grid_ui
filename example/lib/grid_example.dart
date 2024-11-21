import 'package:flutter/material.dart';
import 'package:flutter_grid_ui/flutter_grid_ui.dart';

class GridExample extends StatefulWidget {
  const GridExample({super.key});

  @override
  State<GridExample> createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  final _items = List<int>.from([1, 2, 3, 4, 5, 6, 7, 8]);
  final _grid = Grid<int>();

  @override
  Widget build(BuildContext context) {
    final filtereditems =
        _items.where((item) => !_grid.contains(item)).toList();
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Use drag and drop',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GridWidget(
                    grid: _grid,
                    itemBuilder: (context, data, rowindex, cellIndex) =>
                        _getGridItem(data, isDecorated: true, isEmpty: false),
                    emptyBuilder: (context, rowIndex, cellIndex) =>
                        DragTarget<int>(
                      onAcceptWithDetails: (data) {
                        setState(() {
                          if (rowIndex >= 0 && cellIndex < 0) {
                            _grid.putAt(
                                rowIndex, [CellData(index: 0, data: data.data)],
                                cellOffset: true);
                          } else if (rowIndex < 0 && cellIndex >= 0) {
                            _grid.putAt(0,
                                [CellData(index: cellIndex, data: data.data)],
                                offset: true);
                          } else {
                            _grid.putAt(rowIndex >= 0 ? rowIndex : 0,
                                [CellData(index: cellIndex, data: data.data)]);
                          }
                        });
                      },
                      builder: (context, candidateData, rejectedData) =>
                          _getGridItem(null,
                              isEmpty: false,
                              isDecorated: candidateData.isNotEmpty),
                    ),
                    outerBuilder: (context, rowIndex, cellIndex) =>
                        _getGridItem(null),
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: ListView.builder(
                    itemCount: filtereditems.length,
                    itemBuilder: (context, index) => Draggable(
                        data: filtereditems[index],
                        feedback: _getGridItem(filtereditems[index],
                            isEmpty: false, isDecorated: true),
                        child:
                            _getGridItem(filtereditems[index], isEmpty: false)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getGridItem(int? item,
      {bool isDecorated = false, bool isEmpty = true}) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: !isEmpty ? Border.all(color: Colors.black) : null,
          color: isDecorated
              ? Colors.grey
              : item != null
                  ? Colors.black12
                  : null,
        ),
        padding: const EdgeInsets.all(8),
        width: 200.0,
        height: 100.0,
        alignment: Alignment.center,
        child: item != null
            ? Text(
                item.toString(),
                textAlign: TextAlign.center,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
