import 'package:flutter/material.dart';
import 'package:minesweeper/mine_cell.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Minesweeper',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AppBackground());
  }
}

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: MinesweeperBoard(),
    );
  }
}

class MinesweeperBoard extends StatelessWidget {
  const MinesweeperBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MineCell(size: 30, type: MineCellType.bomb),
          MineCell(size: 30, type: MineCellType.unrevealed),
          MineCell(size: 30, type: MineCellType.one),
        ],
      ),
    );
  }
}
