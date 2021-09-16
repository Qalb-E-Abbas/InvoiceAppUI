import 'package:flutter/material.dart';
import 'package:invoiceapp/Model/dart/editinvoicetabbar.dart';
import 'package:invoiceapp/constant.dart';
class InvoiceNumberScreen extends StatefulWidget {
  const InvoiceNumberScreen({Key? key}) : super(key: key);

  @override
  _InvoiceNumberScreenState createState() => _InvoiceNumberScreenState();
}

class _InvoiceNumberScreenState extends State<InvoiceNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body:SingleChildScrollView(
          child: Column(
            children: [
          Container(
          height: MediaQuery.of(context).size.height*0.13,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color:AppColors.primeryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 20),
                child: Row(
                  children: [
                    Icon(Icons.menu,color: Colors.white,),
                    SizedBox(
                      width: 150,
                    ),
                    Text("Report",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
          ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBarPage(),
              )

            ],
          ),
        )
    );
  }
}

