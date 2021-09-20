import 'package:flutter/material.dart';


import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

import 'chooseClient2.dart';

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
      backgroundColor: Colors.grey[200],
      floatingActionButton: CircleAvatar(

        radius: 33,
        backgroundColor: Colors.white,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseClient2()));
          },
          backgroundColor: AppColors.primaryColor,
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
              CustomAppBar(text: "Client", isClient: true,),

              VerticalHeight(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                      DynamicFontSize(
                        label: 'Clients',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )
                    ),

                    VerticalHeight(height: 10,),

                    Utiles.getStyledTextField(
                        controller: _clientNameController,
                        hint: "Client 1", isNumber: false),

                    VerticalHeight(height: 10,),

                    Utiles.getStyledTextField(
                        controller: _clientNameController,
                        hint: "Client 2", isNumber: false),

                    VerticalHeight(height: 10,),

                    Utiles.getStyledTextField(
                        controller: _clientNameController,
                        hint: "Client 3", isNumber: false),

                  ],
                ),

              ),


            ],
          ),
        ),
      ),
    );
  }
}

