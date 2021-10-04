import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/Views/Tabs%20Screens/edit_preview_invoices_tabs.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:provider/provider.dart';

class ContainerMarkAsPaid extends StatelessWidget {
  String ClientName;
  var icon;
  String text;
  String price;
  bool status;
  InvoiceModel invoiceModel;

  ContainerMarkAsPaid(
      {required this.ClientName,
      this.icon,
      required this.text,
      required this.price,
      required this.invoiceModel,
      required this.status});

  InvoiceServices _invoiceServices = InvoiceServices();

  @override
  Widget build(BuildContext context) {
    var appStatus = Provider.of<AppState>(context);
    return Container(
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ClientName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() =>
                          EditPreviewInvoiceTabs(invoiceModel: invoiceModel));
                    },
                    child: Icon(
                      icon,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: MaterialButton(
                          onPressed: () async {
                            if (!status) {
                              await _invoiceServices
                                  .updateInvoice(
                                      context, invoiceModel.docID.toString())
                                  .then((value) {
                                if (appStatus.getStateStatus() ==
                                    StateStatus.IsFree) {
                                  showNavigationDialog(context,
                                      message: "Status updated sucessfully",
                                      buttonText: "Okay", navigation: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BottomTab()),
                                        (_) => false);
                                  },
                                      secondButtonText: "secondButtonText",
                                      showSecondButton: false);
                                }
                              });
                            }
                          },
                          height: 30,
                          minWidth: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            !status ? "Mark as paid" : "Paid",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          color: Color(0xffe7b21f),
                        ),
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                price,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
