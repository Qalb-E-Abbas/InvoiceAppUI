import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/ContainBox.dart';
import 'package:invoiceapp/Widget/ContainBox2.dart';
import 'package:invoiceapp/Widget/containerbox3.dart';
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
                  itemCount: 4,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ContainerBox3(
                            ClientName: "Client Name",
                            icon: Icons.edit,
                            text: "INV001",
                            price: "23 ",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: PaidContainerBox(
                            ClientName: "Client Name",
                            icon: Icons.edit,
                            text: "INV001",
                            price: "23 ",
                          ),
                        ),
                      ],
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
