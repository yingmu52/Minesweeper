import 'package:flutter/material.dart';

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
        color: Color.fromRGBO(192, 192, 192, 1), child: MinesweeperBoard());
  }
}

class MinesweeperBoard extends StatelessWidget {
  const MinesweeperBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: MineCell(
        width: 200,
        height: 200,
      ),
      alignment: Alignment.center,
    );
  }
}

class MineCell extends StatefulWidget {
  final double width;
  final double height;

  MineCell({this.width, this.height});

  @override
  _MineCellState createState() => _MineCellState();
}

class _MineCellState extends State<MineCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Color.fromRGBO(189, 189, 189, 0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 6, // same as offset
            offset: Offset(6, 6),
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 6, // same as offset
            offset: Offset(-3, -3),
          )
        ],
        shape: BoxShape.rectangle,
      ),
    );
  }
}
