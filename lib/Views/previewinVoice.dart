import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/description_element.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/recharge_row_elements.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/row_elements.dart';
import 'package:invoiceapp/common/dynamicFont.dart';

class PreviewInvoiceScreen extends StatefulWidget {

  const PreviewInvoiceScreen({Key? key}) : super(key: key);

  @override
  _PreviewInvoiceScreenState createState() => _PreviewInvoiceScreenState();
}

class _PreviewInvoiceScreenState extends State<PreviewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('images/audience.png'),
                            fit: BoxFit.cover)),
                    height: 50,
                    width: 80,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Business Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),

            VerticalHeight(height: 30,),


            rowElements(
              text: 'Invoice Form',
              style: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
              text1: 'Invoice To',
              style1: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),

            VerticalHeight(height: 10,),


            rowElements(
              text: 'Business name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: 'Loram ispum',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),

            VerticalHeight(height: 5,),

            rowElements(
              text: '03348605042',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: '03348605042',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),


            VerticalHeight(height: 5,),

            rowElements(
              text: 'www.website.com',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: 'www.website.com',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),

            VerticalHeight(height: 5,),

            rowElements(
              text: 'Gmail:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: 'qalbeabbas964@gmail.com',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),


            VerticalHeight(height: 20,),

            Card(
              elevation: 4,
              child: Column(
                children: [

                  VerticalHeight(height: 10,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RechargeRowElements('Racharge', 'Avjdf'),
                      RechargeRowElements('Date', '09/6/2021'),
                      RechargeRowElements('Due Date', '09/6/2021'),
                      RechargeRowElements('Balance Due', 'Ejujl'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),

                  DescriptionWidget(
                    text:'Description',
                    text1: 'Rate',
                    text2: 'Qnt',
                    color1: AppColors.primaryColor,
                    hasFirst: true, ),

                  VerticalHeight(height: 5,),

                  DescriptionWidget(
                    text:'Luram Epsum',
                    text1: '500',
                    text2: '5',
                    color1: AppColors.blackColor,
                    hasFirst: true, ),

                 VerticalHeight(height: 5,),

                  DescriptionWidget(
                    text:'Luram Epsum',
                    text1: 'Discount',
                    text2: '20',
                    color1: AppColors.blackColor,
                    hasFirst: false, ),

                  VerticalHeight(height: 5,),


                  DescriptionWidget(
                    text:'Luram Epsum',
                    text1: 'Subtotal',
                    text2: '450',
                    color1: AppColors.blackColor,
                    hasFirst: false, ),

                  VerticalHeight(height: 5,),


                  DescriptionWidget(
                    text:'Luram Epsum',
                    text1: 'Tax',
                    text2: '34',
                    color1: AppColors.blackColor,
                    hasFirst: false, ),

                  VerticalHeight(height: 5,),


                  DescriptionWidget(
                    text:'Luram Epsum',
                    text1: 'Total',
                    text2: '450',
                    color1: AppColors.blackColor,
                    hasFirst: false, ),
                ],
              ),
            ),


            VerticalHeight(height: 10,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  DynamicFontSize(label: 'Payment Info',
                    fontSize: 16, color:
                    AppColors.primaryColor,),

                  VerticalHeight(height: 12,),

                  DynamicFontSize(label: 'Bank Transfer', fontSize: 12),

                  VerticalHeight(height: 8,),

                  DynamicFontSize(label: 'Bank Number', fontSize: 12),

                ],
              ),
            ),

            VerticalHeight(height: 10,),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),


            VerticalHeight(height: 10,),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DynamicFontSize(
                fontSize: 14,
                label: 'Notes:',
                color: AppColors.primaryColor,
              ),
            ),

            VerticalHeight(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DynamicFontSize(
                fontSize: 14,
                label: 'Thank you for your business',
                color: AppColors.primaryColor,
              ),
            ),

            VerticalHeight(height: 10,),



          ],
        ),
      ),
    );
  }
}








