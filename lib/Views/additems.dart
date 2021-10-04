import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceapp/application/add_item_provider.dart';
import 'package:invoiceapp/application/total_cost.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/horizontal_width.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:provider/provider.dart';

import 'addtax.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({Key? key}) : super(key: key);

  @override
  _AddItemsScreenState createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  var _labelController = TextEditingController();
  var _quantityController = TextEditingController();
  var _constController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<AddItemProvider>(context);
    var totalCost = Provider.of<TotalCostProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: "Add Item", isClient: false),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DynamicFontSize(
                      fontSize: 14,
                      label: "Item Name or Service Description",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  VerticalHeight(
                    height: 10,
                  ),
                  Utiles.getStyledTextField(
                      controller: _labelController,
                      hint: "item or service description",
                      isNumber: false),
                  VerticalHeight(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DynamicFontSize(
                      fontSize: 14,
                      label: "Unit cost",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  VerticalHeight(
                    height: 10,
                  ),
                  Utiles.getStyledTextField(
                      controller: _constController,
                      hint: "Enter cost",
                      isNumber: true),
                  VerticalHeight(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: DynamicFontSize(
                      fontSize: 14,
                      label: "Quantity",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  VerticalHeight(
                    height: 10,
                  ),
                  Utiles.getStyledTextField(
                      controller: _quantityController,
                      hint: "Enter quantity",
                      isNumber: true),
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
                        itemProvider.saveAddItem(AddItem(
                            name: _labelController.text,
                            cost: _constController.text,
                            quantity: _quantityController.text));
                        totalCost.saveTotalCost(
                            (int.parse(_constController.text) *
                                    int.parse(_quantityController.text))
                                .toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTaxScreen()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          color: AppColors.primaryColor,
                        ),
                        HorizontalWidth(
                          width: 10,
                        ),
                        DynamicFontSize(
                          label: 'Save to my items',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        )
                      ],
                    ),
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