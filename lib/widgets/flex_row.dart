import 'package:flutter/widgets.dart';
import 'package:flutter_flexui/utils/screen_size.dart';

class FlexRow extends StatelessWidget with ScreenSize {
  final List<Widget> children;
  final int colXS, colSm, colMd, colLg;

  final MainAxisSize colMainAxisSize, rowMainAxisSize;
  final MainAxisAlignment colMainAxisAlignment, rowMainAxisAlignment;
  final VerticalDirection colVerticalDirection, rowVerticalDirection;

  const FlexRow({
    Key key,
    int colXS = 1,
    int colSm = 1,
    int colMd = 1,
    int colLg = 1,
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
        this.colMainAxisSize = colMainAxisSize,
        this.rowMainAxisSize = rowMainAxisSize,
        this.colMainAxisAlignment = colMainAxisAlignment,
        this.rowMainAxisAlignment = rowMainAxisAlignment,
        this.colVerticalDirection = colVerticalDirection,
        this.rowVerticalDirection = rowVerticalDirection,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      int maxColumns = _getMaxColumns(context,
          colXS: colXS, colSm: colSm, colMd: colMd, colLg: colLg);
      List<Widget> columns = [];
      List<Widget> rows = [];
      for (Widget child in this.children) {
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
    return Row(
      children: List.from(widgets),
      mainAxisSize: colMainAxisSize,
      mainAxisAlignment: colMainAxisAlignment,
      verticalDirection: colVerticalDirection,
    );
  }

  Widget _addRows(List<Widget> widgets) {
    return Column(
      children: List.from(widgets),
      mainAxisSize: rowMainAxisSize,
      mainAxisAlignment: rowMainAxisAlignment,
      verticalDirection: rowVerticalDirection,
    );
  }

  int _getMaxColumns(
    BuildContext context, {
    int colXS = 1,
    int colSm = 1,
    int colMd = 1,
    int colLg = 1,
  }) {
    switch (ScreenSize.screenSize(context)) {
      case Screen.LG:
        return colLg;
        break;
      case Screen.MD:
        return colMd;
        break;
      case Screen.SM:
        return colSm;
        break;
      default:
        return colXS;
    }
  }
}
