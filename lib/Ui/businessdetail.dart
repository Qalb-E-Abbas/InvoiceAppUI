import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/Box.dart';
import 'package:invoiceapp/Widget/Ibox4.dart';
import 'package:invoiceapp/Widget/button.dart';
import 'package:invoiceapp/constant.dart';
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
            Ibox(text: "Business Details"),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height*0.19,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                  border: Border.all(color: AppColors.primeryColor),
                ),
                child: Center(
                  child: Text(
                    'Business Logo',style: TextStyle(color: AppColors.primeryColor,fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Ibox4(
                text: "Business Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Button(
                pressed: (){},
                  text: "Save", colors: AppColors.primeryColor, bordercolor: AppColors.primeryColor, textcolor: Colors.white),
            )


          ],
        ),
      ),
    );
  }
}
