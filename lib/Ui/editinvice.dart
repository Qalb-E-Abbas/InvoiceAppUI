import 'package:flutter/material.dart';
import 'package:invoiceapp/Model/dart/editinvoicetabbar.dart';
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
      backgroundColor: Colors.grey[300],
      body:SingleChildScrollView(
        child: Column(
          children: [
            Ibox(text: "Invoice"),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TabBarPage(),
            )

          ],
        ),
      )
    );
  }
}

