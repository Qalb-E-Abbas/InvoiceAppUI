import 'package:flutter/material.dart';
import 'package:invoiceapp/Model/dart/editinvoicetabbar.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Textformfeild.dart';
import 'package:invoiceapp/Widget/dropdown.dart';
import 'package:invoiceapp/constant.dart';
class InvoiceNumberScreen extends StatefulWidget {
  const InvoiceNumberScreen({Key? key}) : super(key: key);

  @override
  _InvoiceNumberScreenState createState() => _InvoiceNumberScreenState();
}

class _InvoiceNumberScreenState extends State<InvoiceNumberScreen> {
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
            Ibox(text: "Invoice Number"),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Invoice Number",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "INV001", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Date",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "choose date", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Due Date",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Choose date", isNumber: false),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("term",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            DropDownField(
              hint: "Due on Receipt",
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Po Number",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Add Po number", isNumber: false),

            SizedBox(
              height: 10,
            ),


          ],
        ),
      ),
    );
  }
}

