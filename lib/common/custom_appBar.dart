import 'package:flutter/material.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';

import '../configurations/AppColors.dart';

class CustomAppBar extends StatelessWidget {
  final String? invoiceID;

  InvoiceServices _invoiceServices = InvoiceServices();
  String text;
  bool isClient = false;

  //var Icon;
  Expanded getTitle() {
    return new Expanded(
        child: Center(
            child: new Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))));
  }

  CustomAppBar(
      {required this.text, required this.isClient, this.invoiceID //this.Icon
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            getTitle(),
            isClient
                ? InkWell(
                    onTap: () {
                      showNavigationDialog(context,
                          message: "Do you really want to delete this invoice?",
                          buttonText: "Yes", navigation: () {
                        _invoiceServices
                            .deleteInvoice(context, invoiceID!)
                            .then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomTab()),
                              (route) => false);
                        });
                      }, secondButtonText: "No", showSecondButton: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
