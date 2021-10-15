import 'package:flutter/material.dart';

class BusinessDetailsField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) validator;
  final String label;

  BusinessDetailsField(
      {required this.controller, required this.validator, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: TextFormField(
          validator: (val) => validator(val!),
          controller: controller,
          decoration: InputDecoration(
              labelText: label,
              filled: true,
              fillColor: Colors.white,
              border: UnderlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
