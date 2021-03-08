import 'package:flutter/widgets.dart';
import 'game_meta.dart';

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
                      onLongPress: () {
                        setState(() {
                          widget.gameMeta.flag(i, j);
                        });
                      },
                      onTap: () {
                        setState(() {
                          widget.gameMeta.clickOn(i, j);
                        });
                      },
                      child: data[i][j],
                    )
                ])
        ]);
  }
}
