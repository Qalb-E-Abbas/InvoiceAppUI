

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {

  const SwitchWidget({Key? key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    return Column(
      children: [
        Switch(
          activeColor: Color(0xff5A9679),
          value: isSwitched, onChanged: (value) {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },),
      ],
    );
  }
}