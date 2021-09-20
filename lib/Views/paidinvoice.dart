import 'package:flutter/material.dart';
import 'package:invoiceapp/elements/Paid%20Invoice%20Screen/paidinvoicescreen_container.dart';

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
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.58,
                child: ListView.separated(
                  separatorBuilder: (ctx, index)=> Container(height: 10,),
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: PaidInvoicesScreenContainer(
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

