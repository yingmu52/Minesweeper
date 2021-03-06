import 'package:flutter/material.dart';

class MineCell extends StatefulWidget {
  final double size;
  final MineCellType type;

  MineCell({this.size, this.type});

  @override
  _MineCellState createState() => _MineCellState();
}

class _MineCellState extends State<MineCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: imageFor(widget.type),
    );
  }
}

enum MineCellType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  empty,
  bomb,
  unrevealed,
  flagged,
}

Image imageFor(MineCellType type) {
  switch (type) {
    case MineCellType.one:
      return Image.asset('images/1.png');
    case MineCellType.two:
      return Image.asset('images/2.png');
    case MineCellType.three:
      return Image.asset('images/3.png');
    case MineCellType.four:
      return Image.asset('images/4.png');
    case MineCellType.five:
      return Image.asset('images/5.png');
    case MineCellType.six:
      return Image.asset('images/6.png');
    case MineCellType.seven:
      return Image.asset('images/7.png');
    case MineCellType.eight:
      return Image.asset('images/8.png');

    case MineCellType.bomb:
      return Image.asset('images/bomb.png');
    case MineCellType.empty:
      return Image.asset('images/empty.png');

    case MineCellType.flagged:
      return Image.asset('images/flagged.png');
    case MineCellType.unrevealed:
      return Image.asset('images/unrevealed.png');

    default:
      return null;
  }
}
