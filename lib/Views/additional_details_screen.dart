import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoiceapp/application/add_discount_provider.dart';
import 'package:invoiceapp/application/add_item_provider.dart';
import 'package:invoiceapp/application/add_tax_provider.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/application/client_provider.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/application/payment_provider.dart';
import 'package:invoiceapp/application/total_cost.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/AdditionalDetailsScreen_elements/switch_element.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'Bottom Navigation/bottomNavigation.dart';

class AdditionalDetailsScreen extends StatefulWidget {
  const AdditionalDetailsScreen({Key? key}) : super(key: key);

  @override
  _AdditionalDetailsScreenState createState() =>
      _AdditionalDetailsScreenState();
}

class _AdditionalDetailsScreenState extends State<AdditionalDetailsScreen> {
  InvoiceServices _invoiceServices = InvoiceServices();
  TextEditingController _noteController = TextEditingController();
  String deviceID = "";
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  Business _business = Business();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    getDeviceID().then((value) {
      deviceID = value!;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<AppState>(context);
    return LoadingOverlay(
      isLoading: status.getStateStatus() == StateStatus.IsBusy,
      child: Scaffold(
        body: _getUI(context),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    var status = Provider.of<AppState>(context);
    var addItem = Provider.of<AddItemProvider>(context);
    var addDiscount = Provider.of<AddDiscountProvider>(context);
    var addTax = Provider.of<AddTaxProvider>(context);
    var addClient = Provider.of<AddClientProvider>(context);
    var addBankDetails = Provider.of<AddPaymentProvider>(context);
    var totalCost = Provider.of<TotalCostProvider>(context);
    var user = Provider.of<UserProvider>(context);
    return FutureBuilder(
        future: _flutterSecureStorage.read(key: "key"),
        builder: (_, snapshot) {
          var data = json.decode(snapshot.data.toString());
          if (snapshot.data != null)
            _business = Business(
                ownerName: data['ownerName'],
                logo: data['logo'],
                businessName: data['businessName']);
          return StreamProvider.value(
            value:
                _invoiceServices.streamMyInvoice(user.getUserDetails().docID!),
            initialData: [InvoiceModel()],
            builder: (context, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(text: "Additional details", isClient: false),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _noteController,
                          decoration: InputDecoration(
                              hintText: 'Note',
                              focusedBorder: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    VerticalHeight(
                      height: 20,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: ListTile(
                        leading: DynamicFontSize(
                          fontSize: 14,
                          label: 'Save as default',
                          fontWeight: FontWeight.w100,
                        ),
                        trailing: SwitchWidget(),
                      ),
                    ),
                    VerticalHeight(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                DateFormat.yMd().format(selectedDate),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.date_range),
                              onPressed: () {
                                _selectDate(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalHeight(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Button(
                          pressed: () async {
                            var user = Provider.of<UserProvider>(context,
                                listen: false);
                            await _invoiceServices
                                .createInvoice(context,
                                    model: InvoiceModel(
                                        monthID:
                                            DateTime.now().month.toString(),
                                        invoiceId:
                                            "INV 00${context.read<List<InvoiceModel>>().length}",
                                        date: DateTime.now().toString(),
                                        dueDate: selectedDate.toString(),
                                        description: _noteController.text,
                                        business: user.getUserDetails(),
                                        bankDetails:
                                            addBankDetails.getPayment(),
                                        clientModel: addClient.getClient(),
                                        status: "UNPAID",
                                        tax: addTax.getTax(),
                                        totalCost: totalCost.getTotalCost(),
                                        discountPrice:
                                            addDiscount.getDiscount(),
                                        addItem: addItem.getAddItem()),
                                    deviceID:
                                        user.getUserDetails().docID.toString())
                                .then((value) {
                              if (status.getStateStatus() ==
                                  StateStatus.IsFree) {
                                addItem.clearList();
                                showNavigationDialog(context,
                                    message:
                                        "Invoice has been created successfully.",
                                    buttonText: "Okay", navigation: () {
                                  Get.to(() => BottomTab());
                                },
                                    secondButtonText: "secondButtonText",
                                    showSecondButton: false);
                              }
                            });
                          },
                          text: "Save",
                          colors: AppColors.primaryColor,
                          bordercolor: AppColors.primaryColor,
                          textcolor: Colors.white),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        // _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }
}
