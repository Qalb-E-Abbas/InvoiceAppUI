import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/description_element.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/recharge_row_elements.dart';
import 'package:invoiceapp/elements/previewInvoiceScreen_elements/row_elements.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class PreviewInvoiceScreen extends StatefulWidget {
  final InvoiceModel invoiceModel;

  PreviewInvoiceScreen({required this.invoiceModel});

  @override
  _PreviewInvoiceScreenState createState() => _PreviewInvoiceScreenState();
}

class _PreviewInvoiceScreenState extends State<PreviewInvoiceScreen> {
  int totalResult = 0;

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
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
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
                    imageUrl: widget.invoiceModel.business!.logo.toString(),
                    height: 50,
                    width: 80,
                    placeholder: (context, url) => LoadingWidget(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.invoiceModel.business!.name.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            VerticalHeight(
              height: 30,
            ),
            rowElements(
              text: 'Invoice Form',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              text1: 'Invoice To',
              style1: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            VerticalHeight(
              height: 10,
            ),
            rowElements(
              text: widget.invoiceModel.business!.ownerName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
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
              text: widget.invoiceModel.business!.email.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: widget.invoiceModel.clientModel!.address.toString(),
              style1: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
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
                      RechargeRowElements('Racharge', 'Avjdf'),
                      RechargeRowElements(
                        'Date',
                        DateFormat.yMEd()
                            .format(DateTime.parse(
                                widget.invoiceModel.date.toString()))
                            .toString(),
                      ),
                      RechargeRowElements(
                          'Due Date',
                          DateFormat.yMEd().format(DateTime.parse(
                              widget.invoiceModel.dueDate.toString()))),
                      RechargeRowElements(
                        'Balance Due',
                        getTotalPrice(
                                subTotal: getSubTotalPrice(
                                    totalCost: int.parse(widget
                                        .invoiceModel.totalCost
                                        .toString()),
                                    discountPrice: int.parse(widget
                                        .invoiceModel.discountPrice!.value
                                        .toString())),
                                tax: int.parse(
                                    widget.invoiceModel.tax!.rate.toString()))
                            .toString(),
                      ),
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
                    text: 'Description',
                    text1: 'Rate',
                    text2: 'Qnt',
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
                    DescriptionWidget(
                      text: 'Luram Epsum',
                      text1: 'Discount',
                      text2:
                          widget.invoiceModel.discountPrice!.value.toString(),
                      color1: AppColors.blackColor,
                      hasFirst: false,
                    ),
                  VerticalHeight(
                    height: 5,
                  ),
                  if (widget.invoiceModel.discountPrice!.value != "0")
                    DescriptionWidget(
                      text: 'Luram Epsum',
                      text1: 'Subtotal',
                      text2: getSubTotalPrice(
                        totalCost:
                            int.parse(widget.invoiceModel.totalCost.toString()),
                        discountPrice: int.parse(widget
                            .invoiceModel.discountPrice!.value
                            .toString()),
                      ).toString(),
                      color1: AppColors.blackColor,
                      hasFirst: false,
                    ),
                  VerticalHeight(
                    height: 5,
                  ),
                  if (widget.invoiceModel.tax!.rate != "0")
                    DescriptionWidget(
                      text: 'Luram Epsum',
                      text1: 'Tax',
                      text2: widget.invoiceModel.tax!.rate.toString(),
                      color1: AppColors.blackColor,
                      hasFirst: false,
                    ),
                  VerticalHeight(
                    height: 5,
                  ),
                  DescriptionWidget(
                    text: 'Luram Epsum',
                    text1: 'Total',
                    text2: getTotalPrice(
                            subTotal: getSubTotalPrice(
                                totalCost: int.parse(
                                    widget.invoiceModel.totalCost.toString()),
                                discountPrice: int.parse(widget
                                    .invoiceModel.discountPrice!.value
                                    .toString())),
                            tax: int.parse(
                                widget.invoiceModel.tax!.rate.toString()))
                        .toString(),
                    color1: AppColors.blackColor,
                    hasFirst: false,
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
                    label: 'Payment Info',
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                  VerticalHeight(
                    height: 12,
                  ),
                  DynamicFontSize(
                      label: widget.invoiceModel.bankDetails!.other.toString(),
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
                label: 'Notes:',
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
    );
  }

  int getSubTotalPrice({required int totalCost, required int discountPrice}) {
    print(discountPrice);
    return totalCost - discountPrice;
  }

  int getTotalPrice({required int subTotal, required int tax}) {
    return tax == 0 ? subTotal * 1 : subTotal * tax;
  }
}
