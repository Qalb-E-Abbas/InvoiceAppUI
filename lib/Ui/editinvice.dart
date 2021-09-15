import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/Box.dart';
class EditInvoiceScreen extends StatefulWidget {
  const EditInvoiceScreen({Key? key}) : super(key: key);

  @override
  _EditInvoiceScreenState createState() => _EditInvoiceScreenState();
}

class _EditInvoiceScreenState extends State<EditInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [
              Ibox(text: "Invoice"),
              
            ],
          ),
        ),
      )
    );
  }
}

