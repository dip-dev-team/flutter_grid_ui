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
      body: Row(
        children: [
          Expanded(
            child: GridWidget(
              grid: _grid,
              itemBuilder: (context, data) => _getContainer(data, true),
              emptyBuilder: (context) => DragTarget<int>(
                onAccept: (data) {
                  setState(() {
                    _grid.add().add(data);
                  });
                },
                builder: (context, candidateData, rejectedData) =>
                    _getContainer(null, candidateData.isNotEmpty),
              ),
            ),
          ),
          SizedBox(
            width: 200.0,
            child: ListView.builder(
              itemCount: filtereditems.length,
              itemBuilder: (context, index) => Draggable(
                  data: filtereditems[index],
                  feedback: _getContainer(filtereditems[index], true),
                  child: _getContainer(filtereditems[index], false)),
            ),
          )
        ],
      ),
    );
  }

  Widget _getContainer(int? item, bool isDecorated) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isDecorated ? Colors.grey : null,
        ),
        padding: const EdgeInsets.all(8),
        width: 200.0,
        height: 100.0,
        alignment: Alignment.center,
        child: Text(
          item?.toString() ?? ' - ',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
