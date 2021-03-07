import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minesweeper/mine_cell.dart';
import 'package:minesweeper/mine_cell_type.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Minesweeper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MinesweeperBoard());
  }
}

class MinesweeperBoard extends StatelessWidget {
  MinesweeperBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var gameMeta = GameMeta(
      width: deviceSize.width,
      height: deviceSize.height,
      cellSize: 30,
    );
    return Container(
      color: Colors.grey,
      child: Column(children: [
        for (var types in gameMeta.data)
          Row(
            children: [
              for (var type in types)
                MineCell(size: gameMeta.cellSize, type: type),
            ],
          )
      ]),
    );
  }
}

class GameMeta {
  double width;
  double height;
  double cellSize;
  double probabilityOfGettingBomb;

  List<List<MineCellType>> data;

  GameMeta({
    this.width = 100,
    this.height = 100,
    this.cellSize = 30,
    this.probabilityOfGettingBomb = 0.1,
  }) {
    data = List.generate(
        _numberOfColumn, (i) => List.generate(_numberOfRow, _getRandom),
        growable: false);
    _addMineIndicators(data);
  }

  void _addMineIndicators(List<List<MineCellType>> data) {
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
            if (data[i + m][j + n] == MineCellType.bomb) {
              bombCount += 1;
            }
          }
        }
        if (data[i][j] != MineCellType.bomb) {
          data[i][j] = data[i][j].getType(bombCount);
        }
      }
    }
  }

  MineCellType _getRandom(int index) {
    var randomNumber = Random().nextInt(100) / 100.0;
    MineCellType type = randomNumber <= probabilityOfGettingBomb
        ? MineCellType.bomb
        : MineCellType.empty;
    return type;
  }

  int get _numberOfColumn {
    return height ~/ cellSize;
  }

  int get _numberOfRow {
    return width ~/ cellSize;
  }
}
