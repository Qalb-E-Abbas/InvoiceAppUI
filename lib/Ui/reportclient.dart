import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/reportbox.dart';
class ReportClientScreen extends StatefulWidget {
  const ReportClientScreen({Key? key}) : super(key: key);

  @override
  _ReportClientScreenState createState() => _ReportClientScreenState();
}

class _ReportClientScreenState extends State<ReportClientScreen> {
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
                child: Ibox8(
                  yearText: "December",
                  clientText: "2",
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

