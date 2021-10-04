import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/additional_details_screen.dart';
import 'package:invoiceapp/application/payment_provider.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:provider/provider.dart';

class PaymentInstructionScreen extends StatefulWidget {
  final BankDetails paymentInstructionScreen;
  const PaymentInstructionScreen(
      {Key? key, required this.paymentInstructionScreen})
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

  @override
  Widget build(BuildContext context) {
    var bankInstruction = Provider.of<AddPaymentProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(text: "Payment Instructions", isClient: false),
          VerticalHeight(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DynamicFontSize(
                    fontSize: 14,
                    label: "Paypal Email",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalHeight(
                  height: 10,
                ),
                Utiles.getStyledTextField(
                    controller: _emailController,
                    hint: "Enter your paypal email",
                    isNumber: false),
                VerticalHeight(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DynamicFontSize(
                    fontSize: 14,
                    label: "Make check payable to",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalHeight(
                  height: 10,
                ),
                Utiles.getStyledTextField(
                    controller: _businessName,
                    hint: "Your or your business' name",
                    isNumber: false),
                VerticalHeight(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DynamicFontSize(
                    fontSize: 14,
                    label: "Bank transfer",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalHeight(
                  height: 10,
                ),
                Utiles.getStyledTextField(
                    controller: _transferController,
                    hint: "Enter bank account # and other detail",
                    isNumber: true),
                VerticalHeight(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DynamicFontSize(
                    fontSize: 14,
                    label: "Other",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalHeight(
                  height: 10,
                ),
                Utiles.getStyledTextField(
                    controller: _toController,
                    hint: "Additional payment instructions",
                    isNumber: false),
                VerticalHeight(
                  height: 20,
                ),
                RaisedButton(onPressed: () {
                  Get.to(() => AdditionalDetailsScreen());
                  bankInstruction
                      .savePayment(BankDetails(other: _toController.text));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
