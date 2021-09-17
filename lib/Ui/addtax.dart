import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/Widget/dropdown.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ibox(text: "Add Tax"),
          Padding(
              padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                    Text("on the total",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),

                  ])),
          SizedBox(
            height: 20,
          ),
          DropDownField(
            hint: "Choose Tax type",
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Label",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 20,
          ),
          Utiles.getStyledTextField(controller: _labelController, hint: "VAT", isNumber: false),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Rate",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          Utiles.getStyledTextField(controller: _rateController, hint: "Enter Rate", isNumber: false),


        ],
      ),
    );
  }
}

