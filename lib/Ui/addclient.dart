import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/clint.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Box3.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/Widget/button.dart';
import 'package:invoiceapp/Widget/dropdown.dart';
import 'package:invoiceapp/constant.dart';
class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  var _clientNameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _emailController = TextEditingController();
  var _faxController = TextEditingController();
  var _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ibox(text: "Business Details"),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Client Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter client name", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Client Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter email", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Client Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter phone number", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Client Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter phone number", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Client Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter phone number", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Button(text: "import from contact", colors: AppColors.primeryColor, bordercolor: AppColors.primeryColor, textcolor: Colors.white),
            )

          ],
        ),
      ),
    );
  }
}
