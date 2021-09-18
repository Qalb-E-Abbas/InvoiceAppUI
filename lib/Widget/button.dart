import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/clint.dart';
import 'package:invoiceapp/constant.dart';
class Button extends StatelessWidget {
  String text;
  var textcolor;
  var colors;
  var bordercolor;
  final VoidCallback pressed;


  Button({required this.text, required this.colors, required this.bordercolor, required this.textcolor,required this.pressed
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: bordercolor)
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            text,style: TextStyle(color: textcolor,fontSize: 14,fontWeight: FontWeight.w500),
          ),
          color: colors,
          onPressed: pressed
        ),
      ),
    );
  }
}
