import 'package:flutter/material.dart';
import 'package:invoiceapp/constant.dart';


class DropDownField extends StatelessWidget {
  String hint;


  DropDownField({required this.hint});

  @override
  final TextEditingController _controller = new TextEditingController();
  var items = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];

  Widget build(BuildContext context) {
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
          controller: _controller,

          decoration: InputDecoration(
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down,color: AppColors.primeryColor,size: 20,),
              onSelected: (String value) {
                _controller.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items
                    .map<PopupMenuItem<String>>((String value) {
                  return new PopupMenuItem(
                      child: new Text(value), value: value);
                }).toList();
              },
            ),
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

