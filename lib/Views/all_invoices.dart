import 'package:flutter/material.dart';
import 'package:invoiceapp/elements/All%20Invoices/all_invoices_markaspaid.dart';
import 'package:invoiceapp/elements/Outstanding%20Screen/outstandingscreen_container.dart';
import 'package:invoiceapp/elements/Paid%20Invoice%20Screen/paidinvoicescreen_container.dart';


class ALLInvoiceScreen extends StatefulWidget {
  const ALLInvoiceScreen({Key? key}) : super(key: key);

  @override
  _ALLInvoiceScreenState createState() => _ALLInvoiceScreenState();
}

class _ALLInvoiceScreenState extends State<ALLInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.58,
        color: Colors.grey[300],
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (BuildContext context,int index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, bottom: 10),
                    child: ContainerMarkAsPaid(
                      ClientName: "Client Name",
                      icon: Icons.edit,
                      text: "INV001",
                      price: "23 ",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, bottom: 10),
                    child: PaidInvoicesScreenContainer(
                      ClientName: "Client Name",
                      icon: Icons.edit,
                      text: "INV001",
                      price: "23 ",
                    ),
                  ),
                ],
              );
            }
        )
      ),
    );
  }
}
