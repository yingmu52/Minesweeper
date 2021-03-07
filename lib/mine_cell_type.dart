import 'package:flutter/material.dart';

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
  MineCellType getType(int number) {
    switch (number) {
      case 1:
        return MineCellType.one;
      case 2:
        return MineCellType.two;
      case 3:
        return MineCellType.three;
      case 4:
        return MineCellType.four;
      case 5:
        return MineCellType.five;
      case 6:
        return MineCellType.six;
      case 7:
        return MineCellType.seven;
      case 8:
        return MineCellType.eight;
      default:
        return MineCellType.empty;
    }
  }

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
