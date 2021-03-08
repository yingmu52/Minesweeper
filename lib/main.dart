import 'package:flutter/material.dart';
import 'package:minesweeper/mine_cell.dart';
import 'package:minesweeper/mine_cell_type.dart';

import 'game_meta.dart';

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
        home: Board());
  }
}

class Board extends StatelessWidget {
  Board({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var gameMeta = GameMeta(
      width: deviceSize.width,
      height: deviceSize.height - 88,
      cellSize: 30,
    );
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.symmetric(vertical: 44),
      child: MineField(gameMeta: gameMeta),
    );
  }
}

class MineField extends StatefulWidget {
  final GameMeta gameMeta;

  const MineField({Key key, this.gameMeta}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineFieldState();
}

class _MineFieldState extends State<MineField> {
  @override
  Widget build(BuildContext context) {
    var gameMeta = widget.gameMeta, data = gameMeta.data;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < data.length; i++)
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var j = 0; j < data[i].length; j++)
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _clickOn(i, j);
                        })
                      },
                      child: data[i][j],
                    )
                ])
        ]);
  }

  void _clickOn(int i, int j) {
    var data = widget.gameMeta.data;

    if (i < 0 || i > data.length - 1 || j < 0 || j > data[i].length - 1) {
      return;
    }

    var currentCell = data[i][j];
    if (currentCell.isRevealed) {
      return;
    }

    if (currentCell.type == MineCellType.bomb) {
      // TODO: game over
      return;
    }

    // update cell and click recursively
    data[i][j] = MineCell(
      size: currentCell.size,
      type: currentCell.type,
      isRevealed: true,
    );

    if (data[i][j].type == MineCellType.empty) {
      _clickOn(i - 1, j);
      _clickOn(i + 1, j);
      _clickOn(i, j - 1);
      _clickOn(i, j + 1);
    }
  }
}
