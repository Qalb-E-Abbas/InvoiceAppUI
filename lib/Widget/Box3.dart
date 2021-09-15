import 'package:flutter/material.dart';
import 'package:invoiceapp/constant.dart';

class Ibox3 extends StatelessWidget {
  String ClientName;
  String text;
  String date;


  Ibox3({required this.ClientName, required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.16,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
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
              new Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ClientName,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(date,style: TextStyle(color: AppColors.primeryColor,fontSize: 16,fontWeight: FontWeight.w700),),



                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
class Ibox6 extends StatelessWidget {
  String Client;
  String text;
  String text2;


  Ibox6({required this.Client, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.16,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                    Text(text2,style: TextStyle(color: AppColors.primeryColor,fontSize: 16,fontWeight: FontWeight.w700),),


                  ],
                ),
              ),
              new Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Client,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),




                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
