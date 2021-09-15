import 'package:flutter/material.dart';
import 'package:invoiceapp/constant.dart';

class Ibox3 extends StatelessWidget {
  String ClientName;
  String text;
  String price;


  Ibox3({required this.ClientName, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.16,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ClientName,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                    Text(text,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Divider()
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,style: TextStyle(color: AppColors.primeryColor,fontSize: 16,fontWeight: FontWeight.w700),),
                    MaterialButton(onPressed: (){},
                      height: 35,
                      minWidth: 65,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text("Paid",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                      color: AppColors.primeryColor,
                    )

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
