import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:invoiceapp/application/add_item_provider.dart';
import 'package:invoiceapp/application/total_cost.dart';
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
import 'addtax.dart';

class AddItemsScreen extends StatefulWidget {
  final List<AddItem> addItem;
  final String invoiceID;
  final bool isUpdateView;

  const AddItemsScreen(
      {Key? key,
      required this.addItem,
      required this.invoiceID,
      required this.isUpdateView})
      : super(key: key);

  @override
  _AddItemsScreenState createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  var _labelController = TextEditingController();
  var _quantityController = TextEditingController();
  var _constController = TextEditingController();
  bool isLoading = false;
  InvoiceServices _invoiceServices = InvoiceServices();
  int listLength = 1;
  int totalResult = 0;
  final _formKey = GlobalKey<FormState>();
  List<AddItemLocal> sizePriceQuantityModel = [
    AddItemLocal(
        name: TextEditingController(),
        cost: TextEditingController(),
        quantity: TextEditingController())
  ];

  @override
  initState() {
    if (widget.isUpdateView) {
      sizePriceQuantityModel.clear();
      setState(() {});
      listLength = widget.addItem.length;
      widget.addItem.map((e) {
        sizePriceQuantityModel.add(AddItemLocal(
          name: TextEditingController(text: e.name),
          quantity: TextEditingController(text: e.quantity),
          cost: TextEditingController(text: e.cost),
        ));

        setState(() {});
      }).toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<AddItemProvider>(context);
    var totalCost = Provider.of<TotalCostProvider>(context);
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: LoadingWidget(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                      text: "Artikel oder Dienstleistung hinzufügen",
                      isClient: false),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listLength,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 8),
                                child: DynamicFontSize(
                                  fontSize: 14,
                                  label: "Artikelname oder Servicebeschreibung",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              VerticalHeight(
                                height: 10,
                              ),
                              Utiles.getStyledTextField(
                                  validator: (val) => val.isEmpty
                                      ? "Feld darf nicht leer sein"
                                      : null,
                                  controller: sizePriceQuantityModel[i].name,
                                  hint: "Artikel- oder Leistungsbeschreibung",
                                  isNumber: false),
                              VerticalHeight(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: DynamicFontSize(
                                  fontSize: 14,
                                  label: "Stückkosten",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              VerticalHeight(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    validator: (val) => val!.isEmpty
                                        ? "Feld darf nicht leer sein"
                                        : null,
                                    controller:
                                        sizePriceQuantityModel[i].quantity,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]")),
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      errorBorder: InputBorder.none,
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Anzahl",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalHeight(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: DynamicFontSize(
                                  fontSize: 14,
                                  label: "Stückkosten",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              VerticalHeight(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    validator: (val) => val!.isEmpty
                                        ? "Feld darf nicht leer sein"
                                        : null,
                                    controller: sizePriceQuantityModel[i].cost,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]")),
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      errorBorder: InputBorder.none,
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.transparent)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Enter cost",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalHeight(
                                height: 40,
                              ),
                            ],
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Button(
                      text: "mehr hinzufügen",
                      colors: AppColors.primaryColor,
                      bordercolor: AppColors.primaryColor,
                      textcolor: Colors.white,
                      pressed: () {
                        listLength++;
                        sizePriceQuantityModel.add(AddItemLocal(
                            name: TextEditingController(),
                            cost: TextEditingController(),
                            quantity: TextEditingController()));
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Button(
                      text: 'Speichern',
                      colors: AppColors.primaryColor,
                      bordercolor: AppColors.primaryColor,
                      textcolor: Colors.white,
                      pressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (widget.isUpdateView) {
                          sizePriceQuantityModel.map((e) {
                            itemProvider.saveAddItem(AddItem(
                                name: e.name.text,
                                cost: e.cost.text,
                                quantity: e.quantity.text));
                          }).toList();
                          sizePriceQuantityModel.map((e) {
                            totalResult += (int.parse(e.cost.text) *
                                int.parse(e.quantity.text));
                            setState(() {});
                            totalCost.saveTotalCost(totalResult.toString());
                          }).toList();
                          print(totalCost.getTotalCost());
                          isLoading = true;
                          setState(() {});
                          _invoiceServices
                              .updateInvoiceItems(
                                  totalCost: totalResult.toString(),
                                  invoiceID: widget.invoiceID,
                                  addItems: itemProvider.getAddItem())
                              .then((value) {
                            isLoading = false;
                            setState(() {});
                            showNavigationDialog(context,
                                message: "Rechnung erfolgreich aktualisiert",
                                buttonText: "OKay", navigation: () {
                              itemProvider.clearList();
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
                          sizePriceQuantityModel.map((e) {
                            itemProvider.saveAddItem(AddItem(
                                name: e.name.text,
                                cost: e.cost.text,
                                quantity: e.quantity.text));
                          }).toList();
                          sizePriceQuantityModel.map((e) {
                            totalResult += (int.parse(e.cost.text) *
                                int.parse(e.quantity.text));
                            setState(() {});
                            totalCost.saveTotalCost(totalResult.toString());
                          }).toList();
                          print(totalCost.getTotalCost());

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTaxScreen(
                                        inoviceID: "",
                                        isUpdateView: false,
                                        tax: Tax(),
                                      )));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
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
