


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

class invoo1_container extends StatelessWidget {
  String ClientName;
  String text;
  String text1;
  String text2;
  String texdate;


  invoo1_container({required this.ClientName, required this.text, required this.text1, required this.text2, required this.texdate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: MediaQuery.of(context).size.height*0.148,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DynamicFontSize(label: ClientName, fontSize: 14,
                      fontWeight: FontWeight.w600,),
                    Icon(Icons.edit,color: AppColors.primaryColor,),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DynamicFontSize(label: text, fontSize: 14,
                    fontWeight: FontWeight.w600,),

                  DynamicFontSize(label: texdate, fontSize: 12,
                    fontWeight: FontWeight.w100,),

                  DynamicFontSize(label: text1, fontSize: 14,
                    fontWeight: FontWeight.w600,),

                  DynamicFontSize(label: text2, fontSize: 12,
                    fontWeight: FontWeight.w100,),



                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}