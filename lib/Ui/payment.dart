import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/Widget/button.dart';
import 'package:invoiceapp/constant.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ibox(text: "Payment Instructions"),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Paypal Email",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 20,
          ),
          Utiles.getStyledTextField(controller: _balanceController, hint: "Enter you paypal email", isNumber: true),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Make check payable to",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 20,
          ),
          Utiles.getStyledTextField(controller: _balanceController, hint: "Your or your business's name", isNumber: true),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Bank Transfer",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 20,
          ),
          Utiles.getStyledTextField(controller: _balanceController, hint: "Enter bank account # and other detail", isNumber: true),
          SizedBox(
            height: 20,
          ),


        ],
      ),
    );
  }
}

