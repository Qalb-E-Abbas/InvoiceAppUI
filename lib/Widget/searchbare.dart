import 'package:flutter/material.dart';



class SearchBar extends StatelessWidget {
  String text;
  var icon;
  //TextEditingController controller;


  SearchBar(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height*0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,


        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            //controller: controller,

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

                fontSize: 14,
              ),
              suffixIcon: Icon(icon),
              contentPadding: EdgeInsets.only(top: 8),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
