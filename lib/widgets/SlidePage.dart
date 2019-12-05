import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/Global.dart';

class SlidePage extends StatelessWidget {
  SlidePage({Key key, @required this.onChanged, @required this.value}) : super(key: key);

  final ValueChanged<double> onChanged;
  final double value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Global.color,
        inactiveTrackColor: Colors.grey,
        thumbColor: Colors.white,
        overlayColor: Global.color,
        valueIndicatorColor: Global.color,
        valueIndicatorTextStyle: TextStyle(color: Colors.white),
      ),
      child: Slider(
        value: value,
        label: '$value',
        min: 0.0,
        max: 30,
        divisions: 10,
        onChanged: (val) {
          _valueChanged(val.floorToDouble());
        },
      ),
    );
  }

  void _valueChanged(double value) {
    onChanged(value);
  }
}