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
          Ibox(text: "Payment"),
          Padding(
              padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                    Text("\$35.0",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),

                  ])),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Paid",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 20,
          ),
          Utiles.getStyledTextField(controller: _balanceController, hint: "Balance Due", isNumber: true),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Button(text: "Add payment", colors: AppColors.primeryColor, bordercolor: AppColors.primeryColor, textcolor: Colors.white),
          )

        ],
      ),
    );
  }
}

