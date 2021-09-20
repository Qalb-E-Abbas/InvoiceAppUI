import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/invoices_list_screens/searchbar.dart';

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
      height: MediaQuery.of(context).size.height*0.26,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        color:AppColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 13),
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
          SearchBar(
            "Search",
            Icons.search,)
        ],
      ),


    );
  }
}
