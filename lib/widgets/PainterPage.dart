
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DrawPage.dart';

class PainterPage extends StatefulWidget {

  PainterPageState createState() => new PainterPageState();
}

class PainterPageState extends State<PainterPage> {

  bool _isFirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flower Chart", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _savePainter, color: Colors.black,)
        ],
      ),
      body: _buildInitPage(context),
    );
  }

  void _savePainter() {
    print("save");
  }

  Widget _buildInitPage(BuildContext context) {
    return Center(
      child: _buildCenterSubviews(context),
    );
  }

  Widget _buildCenterSubviews(BuildContext context) {
      if (_isFirst) {
        return RaisedButton(
          child: Text("Click to Start Draw", style: TextStyle(color: Colors.black),),
          onPressed: () {
            print("Click Start");
            setState(() {
              _isFirst = false;
            });
          },
        );
      } else {
        return DrawPage();
      }
  }
}