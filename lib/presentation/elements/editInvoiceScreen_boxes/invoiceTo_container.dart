import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/presentation/Views/chooseClient2.dart';
import 'package:invoiceapp/presentation/common/dynamicFont.dart';
import 'package:invoiceapp/presentation/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';

class InvoiceToContainer extends StatelessWidget {
  String ClientName;
  String text;
  String text1;
  String invoiceID;
  ClientModel clientModel;

  InvoiceToContainer(
      {required this.ClientName,
      required this.text,
      required this.text1,
      required this.invoiceID,
      required this.clientModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.153,
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
                    DynamicFontSize(
                      label: ClientName,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ChooseClient2(
                              clientModel: clientModel,
                              isUpdateView: true,
                              invoiceID: invoiceID,
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalHeight(
                height: 10,
              ),
              DynamicFontSize(
                label: text,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
              VerticalHeight(
                height: 10,
              ),
              DynamicFontSize(
                label: text1,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
