import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/clientbox.dart';
class ReportPaidScreen extends StatefulWidget {
  const ReportPaidScreen({Key? key}) : super(key: key);

  @override
  _ReportPaidScreenState createState() => _ReportPaidScreenState();
}

class _ReportPaidScreenState extends State<ReportPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Ibox9(
                  yearText: "Haris fazal",
                  invoiceText: '0',
                  paidText: "\$23.3",
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

