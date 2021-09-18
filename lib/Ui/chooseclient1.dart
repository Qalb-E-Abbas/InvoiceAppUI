import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/clint.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/constant.dart';
class ChooseClientScreen1 extends StatefulWidget {
  const ChooseClientScreen1({Key? key}) : super(key: key);

  @override
  _ChooseClientScreen1State createState() => _ChooseClientScreen1State();
}

class _ChooseClientScreen1State extends State<ChooseClientScreen1> {
  var _clientNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: CircleAvatar(
        radius: 33,
        backgroundColor: Colors.white,
        child: FloatingActionButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientScreen()));
          },
          backgroundColor: AppColors.primeryColor,
          child: Icon(Icons.add),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ibox(text: "Client"),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Client",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              SizedBox(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _clientNameController,
                  hint: "Client1", isNumber: false),
              SizedBox(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _clientNameController,
                  hint: "Client2", isNumber: false),
              SizedBox(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _clientNameController,
                  hint: "Client3", isNumber: false),
            ],
          ),
        ),
      ),
    );
  }
}

