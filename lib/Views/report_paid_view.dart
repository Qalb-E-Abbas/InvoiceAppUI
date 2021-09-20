import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/reportbox.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';


class ReportPaidView extends StatefulWidget {
  const ReportPaidView({Key? key}) : super(key: key);

  @override
  _ReportPaidViewState createState() => _ReportPaidViewState();
}

class _ReportPaidViewState extends State<ReportPaidView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [

              VerticalHeight(height: 20,),


              Container(
                height: MediaQuery.of(context).size.height*0.97,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
                child:
                    Column(
                      children: [

                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                DynamicFontSize(label: '2021', fontSize: 14,fontWeight: FontWeight.w700 ),

                                DynamicFontSize(label: 'Invoice', fontSize: 14,fontWeight: FontWeight.w700 ),

                                DynamicFontSize(label: 'Paid', fontSize: 14,fontWeight: FontWeight.w700 )

                              ],
                            ),
                          ),

                        ),

                        Container(

                          height: MediaQuery.of(context).size.height*0.9,
                          width: double.infinity,

                          child: ListView.separated(
                              itemBuilder: (ctx, index){
                                return
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        DynamicFontSize(label: 'December',
                                            fontSize: 14, fontWeight: FontWeight.w700,),

                                        DynamicFontSize(label: '02',
                                          fontSize: 14, fontWeight: FontWeight.w700,),

                                        DynamicFontSize(label: '1000',
                                          fontSize: 14, fontWeight: FontWeight.w700,),

                                      ],
                                    ),
                                  );
                              },
                              separatorBuilder: (ctx, index) => Container(
                                height: 10,
                              ),
                              itemCount: 10),

                        ),

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

