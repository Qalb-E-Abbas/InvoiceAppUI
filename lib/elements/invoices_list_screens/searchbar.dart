import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  String text;
  var icon;
  //TextEditingController controller;


  SearchBar(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 20, top: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),

      child: Center(
        child: TextField(
          //controller: controller,
          textAlign: TextAlign.start,


          onChanged: (value) {

          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: Colors.white,
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            suffixIcon: Icon(icon, color: Colors.black38,),
            // contentPadding: EdgeInsets.only(top: 8),

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
          ),
        ),
      )
    );
  }
}
