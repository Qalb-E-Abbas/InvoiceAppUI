import 'package:flutter/material.dart';

import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/elements/BusinessDetailsScreen_elements/box.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

import 'chooseclient1.dart';
class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({Key? key}) : super(key: key);

  @override
  _BusinessDetailScreenState createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: "Business Details", isClient: false),
            VerticalHeight(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height*0.19,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Center(
                  child: Text(
                    'Business Logo',style: TextStyle(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            VerticalHeight(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Button(
                pressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>ChooseClientScreen1()));
                  },
                  text: "Save", colors: AppColors.primaryColor, bordercolor: AppColors.primaryColor, textcolor: Colors.white),
            )


          ],
        ),
      ),
    );
  }
}
