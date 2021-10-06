import 'package:flutter/material.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/elements/All%20Invoices/all_invoices_markaspaid.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:provider/provider.dart';

class OutStandingScreen extends StatefulWidget {
  const OutStandingScreen({Key? key}) : super(key: key);

  @override
  _OutStandingScreenState createState() => _OutStandingScreenState();
}

class _OutStandingScreenState extends State<OutStandingScreen> {
  InvoiceServices _invoiceServices = InvoiceServices();
  String deviceID = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Container(
        color: Colors.grey[300],
        child: StreamProvider.value(
          value: _invoiceServices
              .streamOutstandingInvoices(user.getUserDetails().docID!),
          initialData: [InvoiceModel()],
          builder: (context, child) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: context.watch<List<InvoiceModel>>().length,
                itemBuilder: (BuildContext context, int i) {
                  return context.watch<List<InvoiceModel>>().isNotEmpty
                      ? context.watch<List<InvoiceModel>>()[0].status == null
                          ? LoadingWidget()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 6, bottom: 10),
                              child: ContainerMarkAsPaid(
                                status: context
                                        .watch<List<InvoiceModel>>()[i]
                                        .status ==
                                    "PAID",
                                invoiceModel:
                                    context.watch<List<InvoiceModel>>()[i],
                                ClientName: context
                                            .watch<List<InvoiceModel>>()[i]
                                            .clientModel!
                                            .name
                                            .toString() ==
                                        "null"
                                    ? ""
                                    : context
                                        .watch<List<InvoiceModel>>()[i]
                                        .clientModel!
                                        .name
                                        .toString(),
                                icon: Icons.edit,
                                text: context
                                    .watch<List<InvoiceModel>>()[i]
                                    .invoiceId
                                    .toString(),
                                price: context
                                    .watch<List<InvoiceModel>>()[i]
                                    .totalCost
                                    .toString(),
                              ),
                            )
                      : Text("No Data");
                });
            // return Column(
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: MediaQuery.of(context).size.height * 0.59,
            //       child: ListView.separated(
            //           separatorBuilder: (ctx, index) => Container(height: 10,),
            //           scrollDirection: Axis.vertical,
            //           itemCount: 5,
            //           itemBuilder: (BuildContext context,int index){
            //             return Padding(
            //               padding: const EdgeInsets.only(left: 6),
            //               child: OutstaningScreenContainer(
            //                 ClientName: "ClientName",
            //                 icon: Icons.edit,
            //                 text: "INV001",
            //                 price: "23 ",
            //               ),
            //             );
            //           }
            //       ),
            //     ),
            //   ],
            // );
          },
        ));
  }
}
