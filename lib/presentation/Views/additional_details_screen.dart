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
import 'package:invoiceapp/presentation/common/button.dart';
import 'package:invoiceapp/presentation/common/custom_appBar.dart';
import 'package:invoiceapp/presentation/common/dynamicFont.dart';
import 'package:invoiceapp/presentation/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/presentation/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_counter_model.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'Bottom Navigation/bottomNavigation.dart';

class AdditionalDetailsScreen extends StatefulWidget {
  final String invoiceID;
  final String docID;
  final bool isUpdateView;
  final String note;
  final String date;
  final String dueDate;

  const AdditionalDetailsScreen(
      {Key? key,
      required this.isUpdateView,
      required this.invoiceID,
      required this.docID,
      required this.date,
      required this.dueDate,
      required this.note})
      : super(key: key);

  @override
  _AdditionalDetailsScreenState createState() =>
      _AdditionalDetailsScreenState();
}

class _AdditionalDetailsScreenState extends State<AdditionalDetailsScreen> {
  InvoiceServices _invoiceServices = InvoiceServices();
  TextEditingController _noteController = TextEditingController();
  TextEditingController _invoiceID = TextEditingController();
  String deviceID = "";
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  Business _business = Business();
  bool isLoading = false;
  DateTime dueDate = DateTime.now();
  DateTime date = DateTime.now();

  @override
  void initState() {
    _noteController = TextEditingController(text: widget.note);
    _invoiceID = TextEditingController(text: widget.invoiceID);
    if (widget.isUpdateView) {
      dueDate = DateTime.parse(widget.dueDate);
      date = DateTime.parse(widget.date);
    }
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
      isLoading: isLoading,
      child: Scaffold(
        body: _getUI(context),
      ),
    );
  }

  int invoiceCounter = 0;

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
            value: _invoiceServices
                .getInvoiceCounter(user.getUserDetails().docID!),
            initialData: [InvoiceCounter()],
            builder: (context, child) {
              context
                  .watch<List<InvoiceCounter>>()
                  .map((e) => print(e.docID))
                  .toList();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(text: "Additional details", isClient: false),
                    VerticalHeight(
                      height: 30,
                    ),
                    if (widget.isUpdateView)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: _invoiceID,
                            decoration: InputDecoration(
                                hintText: 'Invoice ID',
                                focusedBorder: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    VerticalHeight(
                      height: 20,
                    ),
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
                              hintText: 'Anmerkungen',
                              focusedBorder: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    VerticalHeight(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DynamicFontSize(
                            label: "Rechnungsdatum",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
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
                                DateFormat.yMd().format(date),
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
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DynamicFontSize(
                            label: "Zahlbar bis",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
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
                                DateFormat.yMd().format(dueDate),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.date_range),
                              onPressed: () {
                                _selectDueDate(context);
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
                            invoiceCounter =
                                context.read<List<InvoiceCounter>>().length + 1;
                            setState(() {});
                            print("Counter : $invoiceCounter");

                            isLoading = true;
                            setState(() {});
                            if (widget.isUpdateView) {
                              _invoiceServices
                                  .updateInvoiceAdditionalInstruction(context,
                                      invoiceID: _invoiceID.text,
                                      note: _noteController.text,
                                      date: date.toString(),
                                      docID: widget.docID,
                                      dueDate: dueDate.toString())
                                  .then((value) {
                                isLoading = false;
                                setState(() {});
                                showNavigationDialog(context,
                                    message:
                                        "Rechnung erfolgreich aktualisiert",
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
                              var user = Provider.of<UserProvider>(context,
                                  listen: false);
                              await _invoiceServices
                                  .createInvoice(context,
                                      model: InvoiceModel(
                                          monthID:
                                              DateTime.now().month.toString(),
                                          invoiceId: "INV 00$invoiceCounter",
                                          date: date.toString(),
                                          dueDate: dueDate.toString(),
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
                                      deviceID: user
                                          .getUserDetails()
                                          .docID
                                          .toString())
                                  .then((value) {
                                _invoiceServices
                                    .incrementInvoiceCounter(context);
                                isLoading = true;
                                setState(() {});
                                addItem.clearList();
                                showNavigationDialog(context,
                                    message:
                                        "Invoice has been created successfully.",
                                    buttonText: "Okay", navigation: () {
                                  Get.to(() => BottomTab());
                                },
                                    secondButtonText: "secondButtonText",
                                    showSecondButton: false);
                              });
                            }
                          },
                          text: "Speichern",
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

  Future<Null> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dueDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        dueDate = picked;
        // _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        date = picked;
        // _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }
}
