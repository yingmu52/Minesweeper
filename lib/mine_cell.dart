import 'package:flutter/material.dart';
import 'package:minesweeper/mine_cell_type.dart';

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

