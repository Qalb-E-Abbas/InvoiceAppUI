

import 'package:flutter/material.dart';

class rowElements extends StatelessWidget {

  String? text;
  String? text1;
  var style;
  var style1;

  rowElements({
    this.text,
    this.text1,
    this.style,
    this.style1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: style,
          ),
          Text(
            text1!,
            style: style,
          ),
        ],
      ),
    );
  }
}