import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/payment_instructions.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class PaymentInstructionContainer extends StatelessWidget {
  String Client;
  String text;
  String text2;
  String invoiceID;
  final BankDetails bankDetails;

  PaymentInstructionContainer(
      {required this.Client,
      required this.text,
      required this.invoiceID,
      required this.text2,
      required this.bankDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        // Text(text2,style: TextStyle(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  new Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Client,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => PaymentInstructionScreen(
                                invoiceID: invoiceID,
                                isUpdateView: true,
                                paymentInstructionScreen: bankDetails,
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text2,
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
