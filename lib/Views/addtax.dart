import 'package:flutter/material.dart';

import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

import 'adddiscount.dart';
class AddTaxScreen extends StatefulWidget {
  const AddTaxScreen({Key? key}) : super(key: key);

  @override
  _AddTaxScreenState createState() => _AddTaxScreenState();
}

class _AddTaxScreenState extends State<AddTaxScreen> {
  var _labelController = TextEditingController();
  var _rateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: "Add Tax", isClient: false),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 13,top: 25,right: 13),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            DynamicFontSize(
                              fontSize: 14,
                              label: "Tax",
                              fontWeight: FontWeight.w700,),

                            DynamicFontSize(
                              fontSize: 14,
                              label: "On the total",
                              fontWeight: FontWeight.w700,),



                          ])),


                  VerticalHeight(height: 10,),

                  Utiles.getStyledTextField(controller: _labelController, hint: "Tax Name", isNumber: false),

                  VerticalHeight(height: 15,),


                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child:  DynamicFontSize(
                      fontSize: 14,
                      label: 'Label',
                      fontWeight: FontWeight.w700,),
                  ),

                  VerticalHeight(height: 10,),

                  Utiles.getStyledTextField(controller: _labelController, hint: "VAT", isNumber: false),

                  VerticalHeight(height: 15,),

                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child:  DynamicFontSize(
                      fontSize: 14,
                      label: "Rate",
                      fontWeight: FontWeight.w700,),
                  ),

                  Utiles.getStyledTextField(controller: _rateController, hint: "Enter Rate", isNumber: false),

                  VerticalHeight(height: 150,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Button(
                      text: 'Save',
                      colors: AppColors.primaryColor,
                      bordercolor: AppColors.primaryColor,
                      textcolor: Colors.white,
                      pressed: (){
                        Navigator.push(context, MaterialPageRoute
                          (builder: (context)=>AddDiscountScreen()));
                      },),
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}

