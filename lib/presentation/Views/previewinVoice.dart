import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:invoiceapp/Views/pdf_screens/pdf_report.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/app_button.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/description_element.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/recharge_row_elements.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/row_elements.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PreviewInvoiceScreen extends StatefulWidget {
  final InvoiceModel invoiceModel;

  PreviewInvoiceScreen({required this.invoiceModel});

  @override
  _PreviewInvoiceScreenState createState() => _PreviewInvoiceScreenState();
}

class _PreviewInvoiceScreenState extends State<PreviewInvoiceScreen> {
  int totalResult = 0;
  ScreenshotController screenshotController = ScreenshotController();

  initState() {
    widget.invoiceModel.addItem!.map((e) {
      totalResult +=
          (int.parse(e.cost.toString()) * int.parse(e.quantity.toString()));
      setState(() {});
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Screenshot(
            controller: screenshotController,
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                widget.invoiceModel.business!.logo.toString(),
                            height: 50,
                            width: 80,
                            placeholder: (context, url) => LoadingWidget(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    VerticalHeight(
                      height: 30,
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                    rowElements(
                      text: 'Rechnung von',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      text1: 'Rechnung an',
                      style1:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                    rowElements(
                      text: widget.invoiceModel.business!.ownerName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      text1: widget.invoiceModel.clientModel!.name.toString(),
                      style1: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    VerticalHeight(
                      height: 5,
                    ),
                    rowElements(
                      text: widget.invoiceModel.business!.number.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      text1: widget.invoiceModel.clientModel!.number.toString(),
                      style1: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    VerticalHeight(
                      height: 5,
                    ),
                    rowElements(
                      text: widget.invoiceModel.business!.name.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      text1:
                          widget.invoiceModel.clientModel!.address.toString(),
                      style1: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    VerticalHeight(
                      height: 5,
                    ),
                    rowElements(
                      text: widget.invoiceModel.business!.email.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      text1: widget.invoiceModel.clientModel!.email.toString(),
                      style1: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    VerticalHeight(
                      height: 5,
                    ),
                    rowElements(
                      text: widget.invoiceModel.business!.website.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      text1: "",
                      style1: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
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
                            label:
                                "Rechnung # ${widget.invoiceModel.invoiceId}",
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    VerticalHeight(
                      height: 20,
                    ),
                    Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          VerticalHeight(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RechargeRowElements(
                                'Rechnungsdatum',
                                DateFormat.yMEd()
                                    .format(DateTime.parse(
                                        widget.invoiceModel.date.toString()))
                                    .toString(),
                              ),
                              RechargeRowElements(
                                  'Zahlbar bis',
                                  DateFormat.yMEd().format(DateTime.parse(
                                      widget.invoiceModel.dueDate.toString()))),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          DescriptionWidget(
                            text: 'Beschreibung',
                            text1: 'Einzelpreis',
                            text2: 'Menge',
                            text3: 'Amount',
                            color1: AppColors.primaryColor,
                            hasFirst: true,
                          ),
                          VerticalHeight(
                            height: 5,
                          ),
                          ...widget.invoiceModel.addItem!
                              .map(
                                (e) => DescriptionWidget(
                                  text: e.name,
                                  text1: e.cost.toString(),
                                  text2: e.quantity.toString(),
                                  text3:
                                      "${int.parse(e.cost.toString()) * int.parse(e.quantity.toString())}"
                                          .toString(),
                                  color1: AppColors.blackColor,
                                  hasFirst: true,
                                ),
                              )
                              .toList(),
                          VerticalHeight(
                            height: 5,
                          ),
                          Divider(),
                          VerticalHeight(
                            height: 5,
                          ),
                          if (widget.invoiceModel.discountPrice!.value != "0")
                            if (widget.invoiceModel.discountPrice!.type != true)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DynamicFontSize(
                                      fontSize: 12,
                                      label: 'Rabatt',
                                      color: AppColors.blackColor,
                                    ),
                                    DynamicFontSize(
                                      fontSize: 12,
                                      label: widget
                                          .invoiceModel.discountPrice!.value
                                          .toString(),
                                      color: AppColors.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                          if (widget.invoiceModel.discountPrice!.value != "0")
                            if (widget.invoiceModel.discountPrice!.type == true)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DynamicFontSize(
                                      fontSize: 12,
                                      label: 'Rabatt',
                                      color: AppColors.blackColor,
                                    ),
                                    DynamicFontSize(
                                      fontSize: 12,
                                      label: widget
                                              .invoiceModel.discountPrice!.value
                                              .toString() +
                                          " %",
                                      color: AppColors.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                          VerticalHeight(
                            height: 5,
                          ),
                          if (widget.invoiceModel.discountPrice!.value != "0")
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DynamicFontSize(
                                    fontSize: 12,
                                    label: 'Zwischensumme',
                                    color: AppColors.blackColor,
                                  ),
                                  DynamicFontSize(
                                    fontSize: 12,
                                    label: getSubTotalPrice(
                                      totalCost: double.parse(widget
                                          .invoiceModel.totalCost
                                          .toString()),
                                      discountPrice: double.parse(widget
                                          .invoiceModel.discountPrice!.value
                                          .toString()),
                                    ).toString(),
                                    color: AppColors.blackColor,
                                  ),
                                ],
                              ),
                            ),
                          VerticalHeight(
                            height: 5,
                          ),
                          if (widget.invoiceModel.tax!.rate != "0")
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DynamicFontSize(
                                    fontSize: 12,
                                    label: 'MwSt',
                                    color: AppColors.blackColor,
                                  ),
                                  DynamicFontSize(
                                    fontSize: 12,
                                    label: widget.invoiceModel.tax!.rate
                                        .toString(),
                                    color: AppColors.blackColor,
                                  ),
                                ],
                              ),
                            ),
                          VerticalHeight(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DynamicFontSize(
                                  fontSize: 12,
                                  label: 'Gesamt',
                                  color: AppColors.blackColor,
                                ),
                                DynamicFontSize(
                                  fontSize: 12,
                                  label: getTotalPrice(
                                          subTotal: getSubTotalPrice(
                                              totalCost: double.parse(widget
                                                  .invoiceModel.totalCost
                                                  .toString()),
                                              discountPrice: double.parse(widget
                                                  .invoiceModel
                                                  .discountPrice!
                                                  .value
                                                  .toString())),
                                          tax: double.parse(widget
                                              .invoiceModel.tax!.rate
                                              .toString()))
                                      .toString(),
                                  color: AppColors.blackColor,
                                ),
                              ],
                            ),
                          ),
                          VerticalHeight(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DynamicFontSize(
                            label: 'Zahlungsinformationen',
                            fontSize: 16,
                            color: AppColors.primaryColor,
                          ),
                          VerticalHeight(
                            height: 12,
                          ),
                          DynamicFontSize(
                              label: widget.invoiceModel.bankDetails!.other
                                  .toString(),
                              fontSize: 12),
                        ],
                      ),
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DynamicFontSize(
                        fontSize: 14,
                        label: 'Anmerkungen:',
                        color: AppColors.primaryColor,
                      ),
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DynamicFontSize(
                        fontSize: 14,
                        label: widget.invoiceModel.description,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    VerticalHeight(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppButton(
              onTap: () {
                reportView(
                  context,
                  invoiceModel: widget.invoiceModel,
                  total: getTotalPrice(
                          subTotal: getSubTotalPrice(
                              totalCost: double.parse(
                                  widget.invoiceModel.totalCost.toString()),
                              discountPrice: double.parse(widget
                                  .invoiceModel.discountPrice!.value
                                  .toString())),
                          tax: double.parse(
                              widget.invoiceModel.tax!.rate.toString()))
                      .toString(),
                  subTotal: getSubTotalPrice(
                    totalCost:
                        double.parse(widget.invoiceModel.totalCost.toString()),
                    discountPrice: double.parse(
                        widget.invoiceModel.discountPrice!.value.toString()),
                  ).toString(),
                );
                // screenshotController
                //     .capture(delay: Duration(milliseconds: 10))
                //     .then((capturedImage) async {
                //   await _saved(capturedImage!);
                // }).catchError((onError) {
                //   print(onError);
                // });
              },
              text: "Teilen"),
        ],
      ),
    );
  }

  _saved(Uint8List image) async {
    final result = await ImageGallerySaver.saveImage(image);
    Share.shareFiles(["${result['filePath']}".replaceAll("file:/", "")],
        text: 'Invoice Details');
    print(result);
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }

  double getSubTotalPrice(
      {required double totalCost, required double discountPrice}) {
    print(discountPrice);
    if (widget.invoiceModel.discountPrice!.type == true) {
      return totalCost - (discountPrice / 100);
    } else {
      return totalCost.toDouble() - discountPrice.toDouble();
    }
  }

  double getTotalPrice({required double subTotal, required double tax}) {
    return subTotal + tax;
  }
}
