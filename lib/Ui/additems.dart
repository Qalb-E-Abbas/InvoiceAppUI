import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/constant.dart';
class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({Key? key}) : super(key: key);

  @override
  _AddItemsScreenState createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
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
            Ibox(text: "Add Item"),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
              child: Text("Item Name or Service Description",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 20,
            ),
            Utiles.getStyledTextField(controller: _labelController, hint: "item or service description", isNumber: false),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Text("Unit Cost",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 20,
            ),
            Utiles.getStyledTextField(controller: _labelController, hint: "Enter cost", isNumber: true),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Text("Quantity",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
            ),
            Utiles.getStyledTextField(controller: _rateController, hint: "Enter quantity", isNumber: true),
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientScreen()));
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
