import 'package:flutter/material.dart';

import '../constant.dart';
class Ibox extends StatelessWidget {
  String text;
  //var Icon;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 20),
            child: Row(
              children: [
                Icon(Icons.menu,color: Colors.white,),
                SizedBox(
                  width: 150,
                ),
                Text(text,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
          ),


        ],
      ),


    );
  }
}

