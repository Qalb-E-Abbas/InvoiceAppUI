import 'package:flutter/material.dart';
import 'package:invoiceapp/elements/BusinessDetailsScreen_elements/box.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/additem_container.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/invoiceTo_container.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/invoo1_container.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/payment_instruction_container.dart';

class EditInvoicePage extends StatefulWidget {
  const EditInvoicePage({Key? key}) : super(key: key);

  @override
  _EditInvoicePageState createState() => _EditInvoicePageState();
}

class _EditInvoicePageState extends State<EditInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height* 0.7,
          color: Colors.grey[300],
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [

                invoo1_container(
                  ClientName:"INV001",
                  text: "Date",
                  texdate:"06/09/2021",
                  text1: "Due Date",
                  text2:"06/09/2021",
                ),

                VerticalHeight(height: 5,),

                InvoiceToContainer(
                  ClientName: "Invoice to:",
                  text: "Client Name",
                  text1: "add location,email ect",
                ),

                VerticalHeight(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    DynamicFontSize(label: 'Add invoice title (project name, reminder etc '
                        '\nor leave empty.', fontSize: 12,
                      fontWeight: FontWeight.w100,),


                    Icon(Icons.edit,color: AppColors.primaryColor,),
                  ],
                ),



                AddItemContainer(
                  isDiscount: false,
                  text3:"Add item or services" ,
                  text4: "add description",
                  text5: "price:400",
                ),

                AddItemContainer(
                  isDiscount: true,
                  text3:'Discount',
                  text4: 'add % or flat amount',
                  text5: "",
                ),


                AddItemContainer(
                  isDiscount: false,
                  text3:"Add tax" ,
                  text4: "Sales tax 10%",
                  text5: "add %",
                ),


                PaymentInstructionContainer(
                  text: "Payment instruction",
                  Client: "Notes:",
                  text2: "Add information",

                ),
                VerticalHeight(height: 6,),
                Button(
                  pressed: (){},
                  text: "Save",
                  textcolor: Colors.white,
                  colors: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
