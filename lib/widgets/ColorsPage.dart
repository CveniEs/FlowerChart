import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/Global.dart';

class ColorsPage extends StatelessWidget {

  ColorsPage({Key key, @required this.onChanged}) : super(key: key);

  final ValueChanged<Color> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Global.colors.length,
        itemBuilder: (BuildContext context, int index) {
          return _listViewRow(index, context);
    });
  }

  Widget _listViewRow(int index, BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 30) / Global.colors.length;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      width: width,
      height: width,
      child: RaisedButton(
        color: Global.colors[index],
        onPressed: () => _onPressed(index),
      ),
    );
  }

  void _onPressed(int index) {
      print("int ===== {$index}");
      onChanged(Global.colors[index]);
  }
}

