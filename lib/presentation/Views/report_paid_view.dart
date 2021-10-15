import 'package:flutter/material.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:provider/provider.dart';

class ReportPaidView extends StatefulWidget {
  const ReportPaidView({Key? key}) : super(key: key);

  @override
  _ReportPaidViewState createState() => _ReportPaidViewState();
}

class _ReportPaidViewState extends State<ReportPaidView> {
  List<Months> monthList = [
    Months(name: "Jan", id: "1"),
    Months(name: "Feb", id: "2"),
    Months(name: "Mär", id: "3"),
    Months(name: "Apr", id: "4"),
    Months(name: "Mai", id: "5"),
    Months(name: "Jun", id: "6"),
    Months(name: "Jul", id: "7"),
    Months(name: "Aug", id: "8"),
    Months(name: "Sep", id: "9"),
    Months(name: "Okt", id: "10"),
    Months(name: "Nov", id: "11"),
    Months(name: "Dez", id: "12"),
  ];
  InvoiceServices _invoiceServices = InvoiceServices();
  int totalCost = 0;
  List<int> priceList = [];

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
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 70,
                              child: DynamicFontSize(
                                  label: '2021',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            DynamicFontSize(
                                label: 'Rechnung',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            Container(
                              width: 70,
                              child: DynamicFontSize(
                                  label: 'bezahlt',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: double.infinity,
                        child: ListView.separated(
                            itemBuilder: (ctx, i) {
                              return StreamProvider.value(
                                value: _invoiceServices.streamMonthlyInvoice(
                                    monthList[i].id,
                                    user.getUserDetails().docID.toString()),
                                initialData: [InvoiceModel()],
                                builder: (context, child) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 70,
                                          child: DynamicFontSize(
                                            isAlignCenter: false,
                                            label: monthList[i].name,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        DynamicFontSize(
                                          label: context
                                              .watch<List<InvoiceModel>>()
                                              .length
                                              .toString(),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        Container(
                                          width: 70,
                                          child: DynamicFontSize(
                                            label: context
                                                    .watch<List<InvoiceModel>>()
                                                    .isEmpty
                                                ? "N/A"
                                                : getTotalCost(context.watch<
                                                    List<InvoiceModel>>()),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            separatorBuilder: (ctx, index) => Container(
                                  height: 10,
                                ),
                            itemCount: monthList.length)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTotalCost(List<InvoiceModel> list) {
    list.map((e) {
      if (e.totalCost != null) totalCost += int.parse(e.totalCost.toString());
    }).toList();

    return totalCost.toString();
  }
}

class Months {
  String name;
  String id;

  Months({required this.name, required this.id});
}
