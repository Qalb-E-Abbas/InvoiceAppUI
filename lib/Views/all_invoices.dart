import 'package:flutter/material.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/application/total_cost.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/elements/All%20Invoices/all_invoices_markaspaid.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:provider/provider.dart';

class ALLInvoiceScreen extends StatefulWidget {
  const ALLInvoiceScreen({Key? key}) : super(key: key);

  @override
  _ALLInvoiceScreenState createState() => _ALLInvoiceScreenState();
}

class _ALLInvoiceScreenState extends State<ALLInvoiceScreen> {
  InvoiceServices _invoiceServices = InvoiceServices();
  String deviceID = "";

  @override
  initState() {
    getDeviceID().then((value) {
      deviceID = value!;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var totalCost = Provider.of<TotalCostProvider>(context);
    var user = Provider.of<UserProvider>(context);
    print(totalCost.getTotalCost());
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.58,
          color: Colors.grey[300],
          child: StreamProvider.value(
            value:
                _invoiceServices.streamMyInvoice(user.getUserDetails().docID!),
            initialData: [InvoiceModel()],
            builder: (context, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: context.watch<List<InvoiceModel>>().length,
                  itemBuilder: (BuildContext context, int i) {
                    return context.watch<List<InvoiceModel>>().isNotEmpty
                        ? context.watch<List<InvoiceModel>>()[0].status == null
                            ? CircularProgressIndicator()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 6, bottom: 10),
                                child: ContainerMarkAsPaid(
                                  status: context
                                          .watch<List<InvoiceModel>>()[i]
                                          .status ==
                                      "PAID",
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
                                  invoiceModel:
                                      context.watch<List<InvoiceModel>>()[i],
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
            },
          )),
    );
  }
}
