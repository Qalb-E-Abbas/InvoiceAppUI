import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceapp/application/add_item_provider.dart';
import 'package:invoiceapp/application/total_cost.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/app_button.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:provider/provider.dart';

import 'addtax.dart';

class AddItemsScreen extends StatefulWidget {
  final List<AddItem> addItem;
  const AddItemsScreen({Key? key, required this.addItem}) : super(key: key);

  @override
  _AddItemsScreenState createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  var _labelController = TextEditingController();
  var _quantityController = TextEditingController();
  var _constController = TextEditingController();
  int listLength = 1;
  final _formKey = GlobalKey<FormState>();
  List<AddItemLocal> sizePriceQuantityModel = [
    AddItemLocal(
        name: TextEditingController(),
        cost: TextEditingController(),
        quantity: TextEditingController())
  ];

  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<AddItemProvider>(context);
    var totalCost = Provider.of<TotalCostProvider>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: "Add Item", isClient: false),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listLength,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
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
                              controller: sizePriceQuantityModel[i].name,
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
                              controller: sizePriceQuantityModel[i].cost,
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
                              controller: sizePriceQuantityModel[i].quantity,
                              hint: "Enter quantity",
                              isNumber: true),
                          VerticalHeight(
                            height: 150,
                          ),
                        ],
                      ),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    text: "Add More",
                    onTap: () {
                      listLength++;
                      sizePriceQuantityModel.add(AddItemLocal(
                          name: TextEditingController(),
                          cost: TextEditingController(),
                          quantity: TextEditingController()));
                      setState(() {});
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Button(
                  text: 'Save',
                  colors: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor,
                  textcolor: Colors.white,
                  pressed: () {
                    sizePriceQuantityModel.map((e) {
                      itemProvider.saveAddItem(AddItem(
                          name: e.name.text,
                          cost: e.cost.text,
                          quantity: e.quantity.text));
                    }).toList();

                    // totalCost.saveTotalCost((int.parse(sizePriceQuantityModel[i].text) *
                    //         int.parse(_quantityController.text))
                    //     .toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddTaxScreen(
                                  tax: Tax(),
                                )));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddItemLocal {
  final TextEditingController name;
  final TextEditingController cost;
  final TextEditingController quantity;

  AddItemLocal(
      {required this.name, required this.cost, required this.quantity});
}
