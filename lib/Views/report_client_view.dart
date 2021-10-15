import 'package:flutter/material.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/client_services.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:provider/provider.dart';

class ReportClientView extends StatefulWidget {
  const ReportClientView({Key? key}) : super(key: key);

  @override
  _ReportClientViewState createState() => _ReportClientViewState();
}

class _ReportClientViewState extends State<ReportClientView> {
  ClientServices _clientServices = ClientServices();
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

  int totalCost = 0;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [
              VerticalHeight(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.97,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 90,
                              child: DynamicFontSize(
                                  label: 'Name',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            DynamicFontSize(
                                label: 'Rechnung',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            Container(
                              width: 90,
                              child: DynamicFontSize(
                                  label: 'bezahlt',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: double.infinity,
                      child: StreamProvider.value(
                        value: _clientServices
                            .streamMyClient(user.getUserDetails().docID!),
                        initialData: [ClientModel()],
                        builder: (context, child) {
                          return ListView.separated(
                              itemBuilder: (ctx, i) {
                                return StreamProvider.value(
                                  value: _invoiceServices.streamClientInvoice(
                                      context
                                              .watch<List<ClientModel>>()[i]
                                              .docId ??
                                          ""),
                                  initialData: [InvoiceModel()],
                                  builder: (invContext, child) {
                                    if (invContext
                                        .watch<List<InvoiceModel>>()
                                        .isNotEmpty) if (invContext
                                            .watch<List<InvoiceModel>>()[0]
                                            .totalCost !=
                                        null)
                                      getTotalCost(invContext
                                          .watch<List<InvoiceModel>>());
                                    return context
                                            .watch<List<ClientModel>>()
                                            .isNotEmpty
                                        ? context
                                                    .watch<List<ClientModel>>()[
                                                        0]
                                                    .docId ==
                                                null
                                            ? LoadingWidget()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      child: DynamicFontSize(
                                                        isAlignCenter: false,
                                                        label: context
                                                            .watch<
                                                                List<
                                                                    ClientModel>>()[
                                                                i]
                                                            .name,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    DynamicFontSize(
                                                      label: invContext
                                                          .watch<
                                                              List<
                                                                  InvoiceModel>>()
                                                          .length
                                                          .toString(),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    Container(
                                                      width: 90,
                                                      child: DynamicFontSize(
                                                        label: invContext
                                                                .watch<
                                                                    List<
                                                                        InvoiceModel>>()
                                                                .isNotEmpty
                                                            ? totalCost
                                                                .toString()
                                                            : "N/A",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                        : Text("No Data");
                                  },
                                );
                              },
                              separatorBuilder: (ctx, index) => Container(
                                    height: 10,
                                  ),
                              itemCount:
                                  context.watch<List<ClientModel>>().length);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTotalCost(List<InvoiceModel> list) {
    list.map((e) {
      totalCost += int.parse(e.totalCost.toString());
    }).toList();
  }
}
