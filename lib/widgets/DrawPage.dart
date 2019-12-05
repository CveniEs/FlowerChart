
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyPainter.dart';
import 'ColorsPage.dart';
import 'SlidePage.dart';
import '../common/Global.dart';

class DrawPage extends StatefulWidget {
  DrawPageState createState() => new DrawPageState();
}

class DrawPageState extends State<DrawPage> {

  bool _isShowColorAlert = false;
  bool _isShowWidthAlert = false;
  List<Map> _points = <Map>[];

  @override
  Widget build(BuildContext context) {

    return new Stack(
      children: <Widget>[
        GestureDetector(
          onPanDown: (DragDownDetails e) {
            _onPanDown(e);
          },
          onPanUpdate: (DragUpdateDetails e) {
            _onPanUpdate(e);
          },
          onPanEnd: (DragEndDetails e) {
            _onPanEnd(e);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 130, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton.icon(onPressed: _colorSelected, icon: Icon(Icons.colorize), label: Text("颜色", style: TextStyle(color: Colors.black),)),
              RaisedButton.icon(onPressed: _widthSelected, icon: Icon(Icons.create), label: Text("线宽", style: TextStyle(color: Colors.black),)),
              RaisedButton.icon(onPressed: _cancelAction, icon: Icon(Icons.clear), label: Text("清除", style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
        CustomPaint(painter: new MyPainter(points: _points),),
        Padding(
          padding: EdgeInsets.only(left: 15, top: MediaQuery.of(context).size.height - 180, right: 15, bottom: 65),
          child: _isShowColorAlert ? ColorsPage(onChanged: _colorValueChanged,) : null,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: MediaQuery.of(context).size.height - 180, right: 15, bottom: 65),
          child: _isShowWidthAlert ? SlidePage(onChanged: _widthValueChange, value: Global.width,) : null,
        ),
      ],
    );
  }

  void _onPanDown(DragDownDetails e) {
    print("用户手指按下: ${e.globalPosition}");
  }

  void _onPanUpdate(DragUpdateDetails e) {
    print("用户手势移动: ${e.delta.dx}, ${e.delta.dy}");
    RenderBox referenceBox = context.findRenderObject();
    Offset localPosition = referenceBox.globalToLocal(e.localPosition);

    Map map = {
      'color': Global.color,
      'width': Global.width,
      'offset': localPosition
    };
    setState(() {
      _points = new List.from(_points)..add(map);
    });
  }

  void _onPanEnd(DragEndDetails e) {
    print("用户手势拿起: ${e.velocity}");
    _points.add(null);
  }

  void _colorSelected() {
    setState(() {
      _isShowColorAlert = !_isShowColorAlert;
      _isShowWidthAlert = false;
    });
  }

  void _widthSelected() {
    setState(() {
      _isShowColorAlert = false;
      _isShowWidthAlert = !_isShowWidthAlert;
    });
  }

  void _cancelAction() {
    _isShowWidthAlert = false;
    _isShowColorAlert = false;
    _points.clear();
  }

  void _colorValueChanged(Color color) {
    setState(() {
      _isShowColorAlert = false;
      Global.color = color;
    });
  }

  void _widthValueChange(double width) {
    setState(() {
      Global.width = width;
    });
  }
}