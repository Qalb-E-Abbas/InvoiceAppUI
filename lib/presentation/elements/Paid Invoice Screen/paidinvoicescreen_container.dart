import 'package:flutter/material.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
class PaidInvoicesScreenContainer extends StatelessWidget {

  String ClientName;
  var icon;
  String text;
  String price;



  PaidInvoicesScreenContainer({
    required this.ClientName, this.icon, required this.text, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(ClientName,
                    style:
                  TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w700),),

                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(text,style: TextStyle(
                  color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,),),

                  MaterialButton(
                    onPressed: (){},
                    height: 30,
                    minWidth: 65,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("Paid",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                    color: AppColors.primaryColor,
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

