

import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/presentation/common/dynamicFont.dart';
import 'package:invoiceapp/presentation/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

class RechargeRowElements extends StatelessWidget {
  String text;
  String text1;

  RechargeRowElements(this.text, this.text1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicFontSize(label: text, fontSize: 14, color: AppColors.primaryColor,),

        VerticalHeight(height: 10,),

        DynamicFontSize(label: text1, fontSize: 12, color: AppColors.blackColor,)
      ],
    );
  }
}