import 'package:flutter/material.dart';
import 'package:invoiceapp/presentation/common/dynamicFont.dart';
import 'package:invoiceapp/presentation/common/vertical_height.dart';
class Ibox4 extends StatelessWidget {
  String text;

  Ibox4({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            DynamicFontSize(
              label: text,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              isAlignCenter: true,
            ),
          ],
        ),
      ),
    );
  }
}

