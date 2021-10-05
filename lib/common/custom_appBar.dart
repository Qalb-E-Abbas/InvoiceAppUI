import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../configurations/AppColors.dart';

class CustomAppBar extends StatefulWidget {
  final String? invoiceID;

  String text;
  bool isClient = false;

  CustomAppBar(
      {required this.text, required this.isClient, this.invoiceID //this.Icon
      });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  InvoiceServices _invoiceServices = InvoiceServices();

  bool isLoading = false;

  Expanded getTitle() {
    return new Expanded(
        child: Center(
            child: new Text(widget.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))));
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: LoadingWidget(),
      child: Container(
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
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              getTitle(),
              widget.isClient
                  ? InkWell(
                      onTap: () {
                        showNavigationDialog(context,
                            message:
                                "Do you really want to delete this invoice?",
                            buttonText: "Yes", navigation: () {
                          isLoading = true;
                          setState(() {});
                          _invoiceServices
                              .deleteInvoice(context, widget.invoiceID!)
                              .then((value) {
                            isLoading = false;
                            setState(() {});
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
      ),
    );
  }
}
