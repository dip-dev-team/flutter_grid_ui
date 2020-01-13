import 'package:flutter/widgets.dart';
import 'package:flutter_flexui/utils/screen_size.dart';

class FlexRow extends StatefulWidget with ScreenSize {
  final List<Widget> children;
  final int colXS, colSm, colMd, colLg;

  //final CrossAxisAlignment colCrossAxisAlignment, rowCrossAxisAlignment;
  final MainAxisSize colMainAxisSize, rowMainAxisSize;
  final MainAxisAlignment colMainAxisAlignment, rowMainAxisAlignment;
  final VerticalDirection colVerticalDirection, rowVerticalDirection;

  FlexRow({
    Key key,
    int colXS = 1,
    int colSm = 1,
    int colMd = 1,
    int colLg = 1,
    //CrossAxisAlignment colCrossAxisAlignment = CrossAxisAlignment.center,
    //CrossAxisAlignment rowCrossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize colMainAxisSize = MainAxisSize.max,
    MainAxisSize rowMainAxisSize = MainAxisSize.max,
    MainAxisAlignment colMainAxisAlignment = MainAxisAlignment.start,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    VerticalDirection colVerticalDirection = VerticalDirection.down,
    VerticalDirection rowVerticalDirection = VerticalDirection.down,
    List<Widget> children = const <Widget>[],
  })  : this.children = children,
        this.colXS = colXS,
        this.colSm = colSm,
        this.colMd = colMd,
        this.colLg = colLg,
        //this.colCrossAxisAlignment = colCrossAxisAlignment,
        //this.rowCrossAxisAlignment = rowCrossAxisAlignment,
        this.colMainAxisSize = colMainAxisSize,
        this.rowMainAxisSize = rowMainAxisSize,
        this.colMainAxisAlignment = colMainAxisAlignment,
        this.rowMainAxisAlignment = rowMainAxisAlignment,
        this.colVerticalDirection = colVerticalDirection,
        this.rowVerticalDirection = rowVerticalDirection,
        super(key: key);

  @override
  _FlexRowState createState() => _FlexRowState();
}

class _FlexRowState extends State<FlexRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      int maxColumns = widget.getMaxColumns(context,
          xs: widget.colXS,
          sm: widget.colSm,
          md: widget.colMd,
          lg: widget.colLg);
      //Size widgetSize = Size(constraints.maxWidth, constraints.maxHeight);
      List<Widget> columns = [];
      print("maxColumns: " + maxColumns.toString());
      List<Widget> rows = [];
      for (Widget child in widget.children) {
        if (rows.length >= maxColumns) {
          columns.add(_addColums(rows));
          rows.clear();
        }
        rows.add(child);
      }
      if (rows.length > 0) {
        columns.add(_addColums(rows));
        rows.clear();
      }
      return _addRows(columns);
    });
  }

  Widget _addColums(List<Widget> widgets) {
    print("Add columns: " + widgets.length.toString());
    return Row(
      children: List.from(widgets),
      //crossAxisAlignment: widget.colCrossAxisAlignment,
      mainAxisSize: widget.colMainAxisSize,
      mainAxisAlignment: widget.colMainAxisAlignment,
      verticalDirection: widget.colVerticalDirection,
    );
  }

  Widget _addRows(List<Widget> widgets) {
    print("Add rows: " + widgets.length.toString());
    return Column(
      children: List.from(widgets),
      mainAxisSize: widget.rowMainAxisSize,
      mainAxisAlignment: widget.rowMainAxisAlignment,
      verticalDirection: widget.rowVerticalDirection,
      //crossAxisAlignment: widget.rowCrossAxisAlignment,
    );
  }
}
