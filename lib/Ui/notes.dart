import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/payment.dart';
import 'package:invoiceapp/Widget/button.dart';
import 'package:invoiceapp/constant.dart';
class Invoice2 extends StatefulWidget {
  const Invoice2({Key? key}) : super(key: key);

  @override
  _Invoice2State createState() => _Invoice2State();
}

class _Invoice2State extends State<Invoice2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getUI(context),
    );
  }
  Widget _getUI(BuildContext context){
    return SafeArea(

      child: Column(
        children: [
          SizedBox(height: 40,),
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
          SizedBox(height: 20,),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              leading: Text('Save as default'),
              trailing:SwitchWidget() ,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Button(
                pressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                },
                text: "Save", colors: AppColors.primeryColor, bordercolor: AppColors.primeryColor, textcolor: Colors.white),
          )
        ],
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {

  const SwitchWidget({Key? key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    return Column(
      children: [
        Switch(
          activeColor: Color(0xff5A9679),
          value: isSwitched, onChanged: (value) {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },),
      ],
    );
  }
}
