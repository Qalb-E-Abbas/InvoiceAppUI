import 'package:flutter/material.dart';
class Ibox4 extends StatelessWidget {
  String text;

  Ibox4({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(text,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
class Ibox5 extends StatelessWidget {
  String Itemtext;
  String total;
  String price;
  String price2;

  Ibox5({required this.Itemtext, required this.total, required this.price, required this.price2});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.16,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Itemtext,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                  Text(total,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(price,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),),
            SizedBox(
              height: 10,
            ),
            Text(price2,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),),

          ],
        ),
      ),
    );
  }
}

