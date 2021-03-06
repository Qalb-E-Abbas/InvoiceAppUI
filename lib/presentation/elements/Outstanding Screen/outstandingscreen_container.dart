import 'package:flutter/material.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

class OutstaningScreenContainer extends StatelessWidget {

  String ClientName;
  var icon;
  String text;
  String price;

  OutstaningScreenContainer({
    required this.ClientName, this.icon, required this.text, required this.price
});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.179,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ClientName,
                    style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                  Icon(icon,color: AppColors.primaryColor,),

                ],
              ),
            ),


            Padding(
                padding: const EdgeInsets.only(left: 10,right: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Text(text,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: MaterialButton(onPressed: (){},
                          height: 30,
                          minWidth: 110,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text("Mark as paid",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                          color: Color(0xffe7b21f),
                        ),
                      ),
                    ]
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(price,style: TextStyle(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
