import 'package:flutter/material.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/elements/All%20Invoices/all_invoices_markaspaid.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:provider/provider.dart';

class PaidInvoiceScreen extends StatefulWidget {
  const PaidInvoiceScreen({Key? key}) : super(key: key);

  @override
  _PaidInvoiceScreenState createState() => _PaidInvoiceScreenState();
}

class _PaidInvoiceScreenState extends State<PaidInvoiceScreen> {
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
    return SingleChildScrollView(
        child: StreamProvider.value(
      value: _invoiceServices.streamPaidInvoices(deviceID),
      initialData: [InvoiceModel()],
      builder: (context, child) {
        return Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.58,
                  child: ListView.separated(
                      separatorBuilder: (ctx, index) => Container(
                            height: 10,
                          ),
                      scrollDirection: Axis.vertical,
                      itemCount: context.watch<List<InvoiceModel>>().length,
                      itemBuilder: (BuildContext context, int i) {
                        return context.watch<List<InvoiceModel>>().isNotEmpty
                            ? context.watch<List<InvoiceModel>>()[0].status ==
                                    null
                                ? CircularProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6, bottom: 10),
                                    child: ContainerMarkAsPaid(
                                      status: context
                                              .watch<List<InvoiceModel>>()[i]
                                              .status ==
                                          "PAID",
                                      invoiceModel: context
                                          .watch<List<InvoiceModel>>()[i],
                                      ClientName: context
                                                  .watch<List<InvoiceModel>>()[
                                                      i]
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
                      }),
                ),
              ],
            ));
      },
    ));
  }
}
