import 'package:flutter/material.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

class AddItemContainer extends StatelessWidget {
  bool isDiscount = false;
  String text3;
  String text4;
  String text5;
  VoidCallback onTap;

  AddItemContainer(
      {required this.text3,
      required this.text4,
      required this.text5,
      required this.onTap,
      required this.isDiscount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.14,
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
                          label: text3,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () => onTap(),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DynamicFontSize(
                        label: text4,
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                      isDiscount
                          ? Text('')
                          : DynamicFontSize(
                              label: text5,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
