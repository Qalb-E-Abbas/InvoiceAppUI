import 'package:flutter/material.dart';


class HorizontalWidth extends StatelessWidget {

  final double? width;

  const HorizontalWidth({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}