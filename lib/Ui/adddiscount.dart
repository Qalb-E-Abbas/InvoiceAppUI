import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/Widget/dropdown.dart';
import 'package:invoiceapp/constant.dart';
class AddDiscountScreen extends StatefulWidget {
  const AddDiscountScreen({Key? key}) : super(key: key);

  @override
  _AddDiscountScreenState createState() => _AddDiscountScreenState();
}

class _AddDiscountScreenState extends State<AddDiscountScreen> {
  var _prcntController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ibox(text: "Add Discount"),
          Padding(
              padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discunt",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                    Text("Flat Amount",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),

                  ])),
          SizedBox(
            height: 20,
          ),
          DropDownField(hint: "Percentage"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Add Percentage Value",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 20,
          ),
          Utiles.getStyledTextField(controller: _prcntController, hint: "Enter Percentage", isNumber: true),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Note:Percentage value must be valid number",style: TextStyle(color: AppColors.primeryColor,fontSize: 14,fontWeight: FontWeight.w300),),
          ),



        ],
      ),
    );
  }
}

