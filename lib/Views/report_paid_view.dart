import 'package:flutter/material.dart';
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
    Months(name: "January", id: "1"),
    Months(name: "February", id: "2"),
    Months(name: "March", id: "3"),
    Months(name: "April", id: "4"),
    Months(name: "May", id: "5"),
    Months(name: "June", id: "6"),
    Months(name: "July", id: "7"),
    Months(name: "August", id: "8"),
    Months(name: "September", id: "9"),
  ];
  InvoiceServices _invoiceServices = InvoiceServices();
  int totalCost = 0;
  List<int> priceList = [];

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
                            DynamicFontSize(
                                label: '2021',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            DynamicFontSize(
                                label: 'Invoice',
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            DynamicFontSize(
                                label: 'Paid',
                                fontSize: 14,
                                fontWeight: FontWeight.w700)
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
                                value: _invoiceServices
                                    .streamMonthlyInvoice(monthList[i].id),
                                initialData: [InvoiceModel()],
                                builder: (context, child) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DynamicFontSize(
                                          label: monthList[i].name,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        DynamicFontSize(
                                          label: context
                                              .watch<List<InvoiceModel>>()
                                              .length
                                              .toString(),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        DynamicFontSize(
                                          label: context
                                                  .watch<List<InvoiceModel>>()
                                                  .isEmpty
                                              ? ""
                                              : getTotalCost(context
                                                  .watch<List<InvoiceModel>>()),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
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