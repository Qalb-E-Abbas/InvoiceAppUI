import 'package:flutter/material.dart';
import 'package:invoiceapp/application/add_discount_provider.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:provider/provider.dart';

import 'chooseClient2.dart';

class AddDiscountScreen extends StatefulWidget {
  const AddDiscountScreen({Key? key}) : super(key: key);

  @override
  _AddDiscountScreenState createState() => _AddDiscountScreenState();
}

class _AddDiscountScreenState extends State<AddDiscountScreen> {
  var _prcntController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var discountProvider = Provider.of<AddDiscountProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: "Add Discount", isClient: false),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DynamicFontSize(
                        fontSize: 13,
                        label: "Discount Type",
                        fontWeight: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          DynamicFontSize(
                            fontSize: 13,
                            label: "Flat Amount or % (select one)",
                            fontWeight: FontWeight.w700,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ])),
            VerticalHeight(
              height: 20,
            ),
            Utiles.getStyledTextField(
                controller: _prcntController,
                hint: "if % then add % or if flat amount, select it.",
                isNumber: false),
            VerticalHeight(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: DynamicFontSize(
                fontSize: 13,
                color: AppColors.primaryColor,
                label: "Note: Percentage value must be a valid number.",
                fontWeight: FontWeight.w700,
              ),
            ),
            VerticalHeight(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Button(
                text: 'Save',
                colors: AppColors.primaryColor,
                bordercolor: AppColors.primaryColor,
                textcolor: Colors.white,
                pressed: () {
                  discountProvider.saveDiscount(
                      DiscountPrice(label: "", value: _prcntController.text));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChooseClient2()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
