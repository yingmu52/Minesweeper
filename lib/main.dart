import 'package:flutter/material.dart';
import 'game_meta.dart';
import 'mine_field.dart';

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

