import 'package:flutter/material.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';

class PaymentInstructionScreen extends StatefulWidget {
  const PaymentInstructionScreen({Key? key}) : super(key: key);

  @override
  _PaymentInstructionScreenState createState() => _PaymentInstructionScreenState();
}

class _PaymentInstructionScreenState extends State<PaymentInstructionScreen> {
  var _balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(text: "Payment Instructions", isClient: false),

          VerticalHeight(height: 20,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:   DynamicFontSize(
                    fontSize: 14,
                    label: "Paypal Email",
                    fontWeight: FontWeight.w700,),
                ),

                VerticalHeight(height: 10,),

                Utiles.getStyledTextField(
                    controller: _balanceController,
                    hint: "Enter your paypal email", isNumber: true),

                VerticalHeight(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:   DynamicFontSize(
                    fontSize: 14,
                    label: "Make check payable to",
                    fontWeight: FontWeight.w700,),
                ),



                VerticalHeight(height: 10,),

                Utiles.getStyledTextField(controller: _balanceController,
                    hint: "Your or your business' name", isNumber: true),

                VerticalHeight(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:   DynamicFontSize(
                    fontSize: 14,
                    label: "Bank transfer",
                    fontWeight: FontWeight.w700,),
                ),
                VerticalHeight(height: 10,),

                Utiles.getStyledTextField(controller: _balanceController,
                    hint: "Enter bank account # and other detail", isNumber: true),

                VerticalHeight(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:   DynamicFontSize(
                    fontSize: 14,
                    label: "Other",
                    fontWeight: FontWeight.w700,),
                ),
                VerticalHeight(height: 10,),

                Utiles.getStyledTextField(controller: _balanceController, hint: "Additional payment instructions", isNumber: true),

                VerticalHeight(height: 20,),

              ],
            ),
          ),





        ],
      ),
    );
  }
}

