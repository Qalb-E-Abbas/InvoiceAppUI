

import 'package:flutter/material.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

class InvoiceToContainer extends StatelessWidget {
  String ClientName;
  String text;
  String text1;




  InvoiceToContainer({required this.ClientName, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: MediaQuery.of(context).size.height*0.153,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DynamicFontSize(label: ClientName, fontSize: 14,
                      fontWeight: FontWeight.w600,),

                    Icon(Icons.edit,color: AppColors.primaryColor,),

                  ],
                ),
              ),

              VerticalHeight(height: 10,),

              DynamicFontSize(label: text, fontSize: 12, fontWeight: FontWeight.w100,),


              VerticalHeight(height: 10,),

              DynamicFontSize(label: text1, fontSize: 12, fontWeight: FontWeight.w100,),


            ],
          ),
        ),
      ),
    );
  }
}