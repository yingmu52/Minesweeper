import 'dart:math';
import 'package:flutter/material.dart';
import 'package:minesweeper/mine_cell.dart';
import 'mine_cell_type.dart';

class GameMeta {
  double width;
  double height;
  double cellSize;

  double probabilityOfGettingBomb = 0.1;
  List<List<MineCell>> data;
  bool isGameOver = false;

  GameMeta({
    this.width = 100,
    this.height = 100,
    this.cellSize = 30,
  }) {
    reset();
  }

  void reset() {
    data = List.generate(
        _numberOfColumn,
        (i) => List.generate(
            _numberOfRow,
            (j) => MineCell(
                size: cellSize, type: randomType(probabilityOfGettingBomb))));

    for (var i = 0; i < data.length; i++) {
      for (var j = 0; j < data[i].length; j++) {
        var directions = [
          [-1, -1],
          [-1, 0],
          [-1, 1],
          [0, -1],
          [0, 1],
          [1, -1],
          [1, 0],
          [1, 1],
        ];
        var bombCount = 0;
        for (var direction in directions) {
          var m = direction.first, n = direction.last;
          if (i + m >= 0 &&
              i + m < data.length &&
              j + n >= 0 &&
              j + n < data[i + m].length) {
            if (data[i + m][j + n].type == MineCellType.bomb) {
              bombCount += 1;
            }
          }
        }

        var currentCell = data[i][j];
        var type = currentCell.type == MineCellType.bomb
            ? currentCell.type
            : typeOf(bombCount);

        data[i][j] = MineCell(
          size: cellSize,
          type: type,
          isRevealed: false,
          isFlagged: false,
        );
      }
    }
  }

  void showAllBombsAndHighlight(int m, int n) {
    for (var i = 0; i < data.length; i++) {
      for (var j = 0; j < data[i].length; j++) {
        var currentCell = data[i][j];
        if (currentCell.type == MineCellType.bomb) {
          data[i][j] = MineCell(
            size: cellSize,
            type: data[i][j].type,
            isRevealed: true,
            isFlagged: false,
            color: (i == m && j == n) ? Colors.red : Colors.grey,
          );
        }
      }
    }
  }

  int get _numberOfColumn {
    return height ~/ cellSize;
  }

  int get _numberOfRow {
    return width ~/ cellSize;
  }

  void clickOn(int i, int j) {
    // game over
    if (isGameOver) {
      isGameOver = false;
      reset();
      return;
    }

    // index of out bound
    if (i < 0 || i > data.length - 1 || j < 0 || j > data[i].length - 1) {
      return;
    }

    // should not click on cell that is already revealed
    var currentCell = data[i][j];
    if (currentCell.isRevealed) {
      return;
    }

    // update cell and click recursively
    data[i][j] = MineCell(
      size: currentCell.size,
      type: currentCell.type,
      isRevealed: true,
    );

    calculateFlaggedBombs();

    // step on the bomb, and the game should be over
    if (currentCell.type == MineCellType.bomb) {
      showAllBombsAndHighlight(i, j);
      isGameOver = true;
      return;
    }

    // trigger recursive call on empty cell
    if (data[i][j].type == MineCellType.empty) {
      clickOn(i - 1, j);
      clickOn(i + 1, j);
      clickOn(i, j - 1);
      clickOn(i, j + 1);
    }
  }

  void flag(int i, int j) {
    var currentCell = data[i][j];

    if (isGameOver || currentCell.isFlagged) return;

    data[i][j] = MineCell(
      size: cellSize,
      type: currentCell.type,
      isRevealed: false,
      isFlagged: true,
    );

    calculateFlaggedBombs();
  }

  void calculateFlaggedBombs() {
    var totalBombs = 0, flaggedBombs = 0;
    for (var cells in data) {
      for (var cell in cells) {
        if (cell.type == MineCellType.bomb) {
          totalBombs += 1;
          if (cell.isFlagged) {
            flaggedBombs += 1;
          }
        }
      }
    }
    print("total: $totalBombs flagged: $flaggedBombs");
    if (totalBombs == flaggedBombs) {
      isGameOver = false;
      reset();
    }
  }
}
