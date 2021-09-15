import 'package:flutter/material.dart';
class DiscountBox extends StatelessWidget {
  String discountPrice;
  String disPrice;
  String tPrice1;
  String totlPrice1;
  String payPrice1;
  String taxPrice;
  String totalPrice;
  String paymentPrice;


  DiscountBox({
    required this.discountPrice, required this.disPrice, required this.tPrice1, required this.totlPrice1,
    required this.payPrice1, required this.taxPrice, required this.totalPrice, required this.paymentPrice
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.17,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,

      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(discountPrice,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
               Text(disPrice,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(taxPrice,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                Text(tPrice1,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(totalPrice,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                Text(totlPrice1,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(paymentPrice,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                Text(payPrice1,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
