import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/ContainBox2.dart';

class PaidInvoiceScreen extends StatefulWidget {
  const PaidInvoiceScreen({Key? key}) : super(key: key);

  @override
  _PaidInvoiceScreenState createState() => _PaidInvoiceScreenState();
}

class _PaidInvoiceScreenState extends State<PaidInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: PaidContainerBox(
                          ClientName: "Client Name",
                          icon: Icons.edit,
                          text: "INV001",
                          price: "23 ",
                        ),
                      );
                    }
                ),
              ),
            ],
          )
      ),
    );
  }
}

