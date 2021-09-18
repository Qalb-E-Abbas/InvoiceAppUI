import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/adddiscount.dart';
import 'package:invoiceapp/Ui/additems.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/Widget/dropdown.dart';
import 'package:invoiceapp/constant.dart';
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
            Utiles.getStyledTextField(controller: _labelController, hint: "Tax Name", isNumber: false),
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
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: AppColors.primeryColor)
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Save",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                    ),
                    color: AppColors.primeryColor,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDiscountScreen()));
                    },
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

