import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/searchbare.dart';
import 'package:invoiceapp/constant.dart';
class AppBarBox extends StatelessWidget {
  String text;

  Expanded getTitle() {
    return new Expanded(
        child: new Text(text, style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center)
    );
  }
  AppBarBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.24,
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
            padding: const EdgeInsets.only(top: 50,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Icon(Icons.menu,color: Colors.white,),
                getTitle(),
                Text("           ")
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SearchBar("Search",
            Icons.search,)
        ],
      ),


    );
  }
}
