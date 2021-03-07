import 'package:flutter/material.dart';

class MineCell extends StatefulWidget {
  final double size;
  final MineCellType type;
  bool isRevealed;
  bool isFlagged;

  MineCell({
    this.size,
    this.type = MineCellType.unrevealed,
    this.isRevealed = false,
    this.isFlagged = false,
  });

  @override
  _MineCellState createState() => _MineCellState();
}

class _MineCellState extends State<MineCell> {
  void _reveal() {
    if (widget.isRevealed) return;

    setState(() {
      widget.isRevealed = true;
    });
  }

  void _flag() {
    if (widget.isRevealed) return;

    setState(() {
      widget.isFlagged = !widget.isFlagged;
    });
  }

  Image get currentImage {
    return widget.isRevealed
        ? widget.type.image
        : widget.isFlagged
            ? MineCellType.flagged.image
            : MineCellType.unrevealed.image;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _flag,
      onTap: _reveal,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: currentImage,
      ),
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

extension MineCellTypeExtension on MineCellType {

  Image get image {
    switch (this) {
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
}
