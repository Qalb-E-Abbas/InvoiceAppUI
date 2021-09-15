import 'package:flutter/material.dart';

class Utiles{
  static Widget getStyledTextField({
    required TextEditingController controller,
    required String hint,
    required bool isNumber,

  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 60,
        width: double.infinity,
        //color: Colors.black,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          textAlign: TextAlign.start,
          controller: controller,
          keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.transparent)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.transparent)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.transparent)
            ),
            errorBorder: InputBorder.none,
            disabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.transparent)
            ),

            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey
            ),

          ),

        ),
      ),
    );
  }
}
