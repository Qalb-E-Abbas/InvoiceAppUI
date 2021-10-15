import 'package:flutter/material.dart';
import 'package:invoiceapp/presentation/common/dynamicFont.dart';

import '../../common/horizontal_width.dart';
import '../../common/horizontal_width.dart';
import '../../common/horizontal_width.dart';
import '../../common/horizontal_width.dart';

class DescriptionRow extends StatelessWidget {

  String? text;
  String? text1;
  String? text2;
  String? text3;
  Color? color1;
  bool? hasFirst = false;

  DescriptionRow({
    @required this.text,
    @required this.text1,
    @required this.text2,
    @required this.color1,
    @required this.text3,
    @required this.hasFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          DynamicFontSize(
            fontSize: 12,
            label: text,
            color: hasFirst! ? color1 : Colors.white,
          ),


          DynamicFontSize(
            fontSize: 12,
            label: text1,
            fontWeight: FontWeight.w700,
          ),




          DynamicFontSize(
            fontSize: 12,
            label: text2,
            fontWeight: FontWeight.w700,
          ),
          DynamicFontSize(
            fontSize: 12,
            label: text3,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}


class DescriptionDetails extends StatelessWidget {

  String? text;
  String? text1;
  String? text2;
  String? text3;
  Color? color1;
  bool? hasFirst = false;

  DescriptionDetails({
    @required this.text,
    @required this.text1,
    @required this.text2,
    @required this.color1,
    @required this.text3,
    @required this.hasFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [




          DynamicFontSize(
            fontSize: 12,
            label: text,
            color: hasFirst! ? color1 : Colors.white,
          ),


          HorizontalWidth(width: 5,),

          DynamicFontSize(
            fontSize: 12,
            label: text1,
            fontWeight: FontWeight.w700,
          ),


          HorizontalWidth(width: 5,),


          DynamicFontSize(
            fontSize: 12,
            label: text2,
            fontWeight: FontWeight.w700,
          ),
          DynamicFontSize(
            fontSize: 12,
            label: text3,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}