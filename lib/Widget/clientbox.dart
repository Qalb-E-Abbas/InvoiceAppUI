import 'package:flutter/material.dart';
class Ibox9 extends StatelessWidget {
  String yearText;
  //String clientText;
  String invoiceText;
  String paidText;


  Ibox9({required this.yearText, required this.invoiceText, required this.paidText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.97,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("2021",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                Container(
                  width: MediaQuery.of(context).size.height*0.2,


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     // Text("Client",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                      Text("Invoice",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                      Text("Paid",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),

                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(yearText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                Container(
                  width: MediaQuery.of(context).size.height*0.2,


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Text(clientText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                      Text(invoiceText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
                      Text(paidText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),

                    ],
                  ),
                )
              ],
            ),



          ],
        ),
      ),
    );
  }
}
