import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoiceapp/application/add_tax_provider.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'Bottom Navigation/bottomNavigation.dart';
import 'adddiscount.dart';

class AddTaxScreen extends StatefulWidget {
  final bool isUpdateView;

  final String inoviceID;

  final Tax tax;

  const AddTaxScreen(
      {Key? key,
      required this.tax,
      required this.isUpdateView,
      required this.inoviceID})
      : super(key: key);

  @override
  _AddTaxScreenState createState() => _AddTaxScreenState();
}

class _AddTaxScreenState extends State<AddTaxScreen> {
  var _labelController = TextEditingController();
  var _rateController = TextEditingController();
  var _nameController = TextEditingController();
  InvoiceServices _invoiceServices = InvoiceServices();
  bool isLoading = false;

  @override
  initState() {
    _labelController = TextEditingController(text: widget.tax.number);
    _rateController = TextEditingController(text: widget.tax.rate);
    _nameController = TextEditingController(text: widget.tax.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tax = Provider.of<AddTaxProvider>(context);
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: LoadingWidget(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: "MwSt", isClient: false),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 13, top: 25, right: 13),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DynamicFontSize(
                                fontSize: 14,
                                label: "MwSt",
                                fontWeight: FontWeight.w700,
                              ),
                            ])),
                    VerticalHeight(
                      height: 10,
                    ),
                    Utiles.getStyledTextField(
                        validator: (val) =>
                            val.isEmpty ? "Feld darf nicht leer sein" : null,
                        controller: _nameController,
                        hint: "Steuername",
                        isNumber: false),
                    VerticalHeight(
                      height: 15,
                    ),
                    VerticalHeight(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: DynamicFontSize(
                        fontSize: 14,
                        label: "Einzelpreis",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        //color: Colors.black,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 7,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          validator: (val) =>
                              val!.isEmpty ? "Field Cannot be empty." : null,
                          controller: _rateController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.transparent)),
                            errorBorder: InputBorder.none,
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.transparent)),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Rate hinzufügen",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    VerticalHeight(
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Button(
                        text: 'Speichern',
                        colors: AppColors.primaryColor,
                        bordercolor: AppColors.primaryColor,
                        textcolor: Colors.white,
                        pressed: () {
                          if (widget.isUpdateView) {
                            _invoiceServices
                                .updateInvoiceTax(
                                    invoiceID: widget.inoviceID,
                                    tax: Tax(
                                        name: _nameController.text,
                                        number: _labelController.text,
                                        rate: _rateController.text == ""
                                            ? "0"
                                            : _rateController.text))
                                .then((value) {
                              isLoading = false;
                              setState(() {});
                              showNavigationDialog(context,
                                  message: "Rechnung erfolgreich aktualisiert",
                                  buttonText: "OKay", navigation: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomTab()),
                                    (route) => false);
                              },
                                  secondButtonText: "secondButtonText",
                                  showSecondButton: false);
                            });
                          } else {
                            tax.saveTax(Tax(
                                name: _nameController.text,
                                number: _labelController.text,
                                rate: _rateController.text));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDiscountScreen(
                                          discountPrice: DiscountPrice(),
                                          invoiceID: "",
                                          isUpdateView: false,
                                        )));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
