import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/application/add_discount_provider.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/flushBar.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'chooseClient2.dart';

class AddDiscountScreen extends StatefulWidget {
  final bool isUpdateView;
  final String invoiceID;
  final DiscountPrice discountPrice;

  const AddDiscountScreen(
      {Key? key,
      required this.discountPrice,
      required this.isUpdateView,
      required this.invoiceID})
      : super(key: key);

  @override
  _AddDiscountScreenState createState() => _AddDiscountScreenState();
}

class _AddDiscountScreenState extends State<AddDiscountScreen> {
  var _prcntController = TextEditingController();
  bool isLoading = false;
  InvoiceServices _invoiceServices = InvoiceServices();
  bool isPercentage = true;

  String _selectedTax = '';
  List<String> taxList = ["Percentage (%)", "Flat Amount"];

  @override
  void initState() {
    // TODO: implement initState
    _selectedTax = "Percentage (%)";
    _prcntController = TextEditingController(text: widget.discountPrice.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var discountProvider = Provider.of<AddDiscountProvider>(context);
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
              CustomAppBar(text: "Add Discount", isClient: false),
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DynamicFontSize(
                          fontSize: 13,
                          label: "Rabattart",
                          fontWeight: FontWeight.w700,
                        ),
                        _getRoleDropDown(context),
                      ])),
              VerticalHeight(
                height: 20,
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
                    controller: _prcntController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
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
                      hintText: "Rabattbetrag eingeben",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              VerticalHeight(
                height: 13,
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
                  pressed: () async {
                    if (int.parse(_prcntController.text) < 0 ||
                        int.parse(_prcntController.text) > 99) {
                      getFlushBar(context,
                          title: "Discount must be in between 0 and 100",
                          icon: Icons.info_outline,
                          color: Colors.blue);
                      return;
                    }
                    if (widget.isUpdateView) {
                      isLoading = true;
                      setState(() {});
                      await _invoiceServices
                          .updateInvoiceDiscount(
                              invoiceID: widget.invoiceID.toString(),
                              discountPrice: DiscountPrice(
                                  label: "",
                                  type: isPercentage,
                                  value: _prcntController.text == ""
                                      ? "0"
                                      : _prcntController.text))
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
                      discountProvider.saveDiscount(DiscountPrice(
                          type: isPercentage,
                          label: "",
                          value: _prcntController.text));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseClient2(
                                    clientModel: ClientModel(),
                                    isUpdateView: false,
                                    invoiceID: "",
                                  )));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRoleDropDown(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor)),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: DropdownButton<String>(
                  value: _selectedTax == "" ? null : _selectedTax,
                  items: taxList.map((value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (item) {
                    _selectedTax = item!;
                    if (item == "Flat Amount") {
                      isPercentage = false;
                    } else {
                      isPercentage = true;
                    }
                    setState(() {});
                    print(isPercentage);
                  },
                  underline: SizedBox(),
                  hint: Text("Pauschal oder Prozentsatz (auswählen)"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
