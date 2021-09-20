import 'package:flutter/material.dart';

import 'package:invoiceapp/common/custom_appBar.dart';

import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

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
            CustomAppBar(text: "Add New client", isClient: false),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              DynamicFontSize(
                fontSize: 16,
                label: "Client Name",
                fontWeight: FontWeight.w700,),
            ),

            VerticalHeight(height: 10,),


            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter client name", isNumber: false),
            VerticalHeight(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  DynamicFontSize(
                fontSize: 16,
                label: "Email",
                fontWeight: FontWeight.w700,),
            ),
            VerticalHeight(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter email", isNumber: false),
            VerticalHeight(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              DynamicFontSize(
                fontSize: 16,
                label: "Phone Number",
                fontWeight: FontWeight.w700,),
            ),
            VerticalHeight(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter phone number", isNumber: false),
            VerticalHeight(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              DynamicFontSize(
                fontSize: 16,
                label: "Fax Number",
                fontWeight: FontWeight.w700,),
            ),
            SizedBox(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter fax number", isNumber: false),
            VerticalHeight(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              DynamicFontSize(
                fontSize: 16,
                label: "Address",
                fontWeight: FontWeight.w700,),
            ),
            VerticalHeight(
              height: 10,
            ),
            Utiles.getStyledTextField(
                controller: _clientNameController,
                hint: "Enter address", isNumber: false),
            VerticalHeight(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Button(
                pressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddClientScreen()));
                },
                  text: "Save Client", colors: AppColors.primaryColor, bordercolor: AppColors.primaryColor, textcolor: Colors.white),
            )

          ],
        ),
      ),
    );
  }
}
