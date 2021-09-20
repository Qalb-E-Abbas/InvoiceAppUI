import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/Views/payment_instructions.dart';

import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/AdditionalDetailsScreen_elements/switch_element.dart';

class AdditionalDetailsScreen extends StatefulWidget {
  const AdditionalDetailsScreen({Key? key}) : super(key: key);

  @override
  _AdditionalDetailsScreenState createState() => _AdditionalDetailsScreenState();
}

class _AdditionalDetailsScreenState extends State<AdditionalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getUI(context),
    );
  }
  Widget _getUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [


          CustomAppBar(text: "Additional details", isClient: false),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),

            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Note',
                    focusedBorder: InputBorder.none,
                    enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          VerticalHeight(height: 20,),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              leading: DynamicFontSize(
                fontSize: 14,
                label: 'Save as default',
                fontWeight: FontWeight.w100,
              ),
              trailing:SwitchWidget() ,
            ),
          ),
          VerticalHeight(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Button(
                pressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>PaymentInstructionScreen()));
                },
                text: "Save",
                colors: AppColors.primaryColor,
                bordercolor: AppColors.primaryColor,
                textcolor: Colors.white),
          )
        ],
      ),
    );
  }
}


