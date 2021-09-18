import 'package:flutter/material.dart';

import '../constant.dart';
class Ibox extends StatelessWidget {
  String text;
  //var Icon;
  Expanded getTitle() {
    return new Expanded(

        child: Center(child: new Text(text, style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)))
    );
  }
  Ibox({required this.text, //this.Icon
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.13,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color:AppColors.primeryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 10,right:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back,color: Colors.white,),
            getTitle(),
            Text("      ",),

          ],
        ),
      ),


    );
  }
}

