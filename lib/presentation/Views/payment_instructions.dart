import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/presentation/Views/additional_details_screen.dart';
import 'package:invoiceapp/application/payment_provider.dart';
import 'package:invoiceapp/presentation/common/Textformfeild.dart';
import 'package:invoiceapp/presentation/common/custom_appBar.dart';
import 'package:invoiceapp/presentation/common/dynamicFont.dart';
import 'package:invoiceapp/presentation/common/vertical_height.dart';
import 'package:invoiceapp/presentation/elements/app_button.dart';
import 'package:invoiceapp/presentation/elements/loading_widget.dart';
import 'package:invoiceapp/presentation/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'Bottom Navigation/bottomNavigation.dart';

class PaymentInstructionScreen extends StatefulWidget {
  final String invoiceID;
  final bool isUpdateView;
  final BankDetails paymentInstructionScreen;

  const PaymentInstructionScreen(
      {Key? key,
      required this.paymentInstructionScreen,
      required this.isUpdateView,
      required this.invoiceID})
      : super(key: key);

  @override
  _PaymentInstructionScreenState createState() =>
      _PaymentInstructionScreenState();
}

class _PaymentInstructionScreenState extends State<PaymentInstructionScreen> {
  var _transferController = TextEditingController();
  var _emailController = TextEditingController();
  var _toController = TextEditingController();
  var _businessName = TextEditingController();
  InvoiceServices _invoiceServices = InvoiceServices();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _toController =
        TextEditingController(text: widget.paymentInstructionScreen.other);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bankInstruction = Provider.of<AddPaymentProvider>(context);
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: LoadingWidget(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: "Zahlungsanweisungen", isClient: false),
            VerticalHeight(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalHeight(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DynamicFontSize(
                      fontSize: 14,
                      label: "Zahlungsinformationen",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  VerticalHeight(
                    height: 10,
                  ),
                  Utiles.getStyledTextField(
                      validator: (val) =>
                          val.isEmpty ? "Feld darf nicht leer sein" : null,
                      controller: _toController,
                      hint: "Zahlungsanweisungen hinzufügen",
                      isNumber: false),
                  VerticalHeight(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppButton(
                        text: "Weiter",
                        onTap: () async {
                          if (widget.isUpdateView) {
                            isLoading = true;
                            setState(() {});
                            await _invoiceServices
                                .updateInvoiceBankDetails(
                                    invoiceID: widget.invoiceID,
                                    bankDetails:
                                        BankDetails(other: _toController.text))
                                .then((value) async {
                              isLoading = false;
                              setState(() {});
                              await showNavigationDialog(context,
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
                            Get.to(() => AdditionalDetailsScreen(
                                  date: "",
                                  note: "",
                                  docID: '',
                                  dueDate: '',
                                  isUpdateView: false,
                                  invoiceID: "",
                                ));
                            bankInstruction.savePayment(
                                BankDetails(other: _toController.text));
                          }
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
