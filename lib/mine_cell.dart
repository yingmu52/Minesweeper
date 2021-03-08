import 'package:flutter/material.dart';
import 'package:minesweeper/mine_cell_type.dart';

class MineCell extends StatelessWidget {
  final double size;
  final MineCellType type;
  final bool isRevealed;
  final bool isFlagged;
  final Color color;

  MineCell({
    this.size,
    this.type,
    this.isRevealed = false,
    this.isFlagged = false,
    this.color = Colors.grey,
  });

  Image get currentImage {
    return isRevealed
        ? type.image
        : isFlagged
            ? MineCellType.flagged.image
            : MineCellType.unrevealed.image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: size,
      height: size,
      child: currentImage,
    );
  }
}
