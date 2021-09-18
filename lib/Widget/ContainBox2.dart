import 'package:flutter/material.dart';
import 'package:invoiceapp/constant.dart';
class PaidContainerBox extends StatelessWidget {
  String ClientName;
  var icon;
  String text;
  String price;



  PaidContainerBox({
    required this.ClientName, this.icon, required this.text, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.167,
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
                    Icon(icon,color: AppColors.primeryColor,),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(text,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,style: TextStyle(color: AppColors.primeryColor,fontSize: 16,fontWeight: FontWeight.w700),),
                    MaterialButton(onPressed: (){},
                      height: 30,
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

