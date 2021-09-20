import 'package:flutter/material.dart';


class VerticalHeight extends StatelessWidget {

  final double? height;

  const VerticalHeight({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
