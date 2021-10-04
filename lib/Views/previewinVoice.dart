import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
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
            if (widget.invoiceModel.business!.businessName != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage('images/audience.png'),
                              fit: BoxFit.cover)),
                      height: 50,
                      width: 80,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.invoiceModel.business!.businessName.toString(),
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
              text: widget.invoiceModel.business!.businessName == null
                  ? ""
                  : widget.invoiceModel.business!.businessName.toString(),
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
              text: widget.invoiceModel.invoiceFrom!.phoneNumber.toString(),
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
              text: widget.invoiceModel.business!.businessName == null
                  ? ""
                  : widget.invoiceModel.business!.ownerName.toString(),
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
              text: widget.invoiceModel.invoiceFrom!.email.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: widget.invoiceModel.clientModel!.email.toString(),
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
                        widget.invoiceModel.totalCost.toString(),
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
                  DescriptionWidget(
                    text: "",
                    text1: widget.invoiceModel.addItem![0].cost.toString(),
                    text2: widget.invoiceModel.addItem![0].quantity.toString(),
                    color1: AppColors.blackColor,
                    hasFirst: true,
                  ),
                  VerticalHeight(
                    height: 5,
                  ),
                  DescriptionWidget(
                    text: 'Luram Epsum',
                    text1: 'Discount',
                    text2: widget.invoiceModel.discountPrice!.value.toString(),
                    color1: AppColors.blackColor,
                    hasFirst: false,
                  ),
                  VerticalHeight(
                    height: 5,
                  ),
                  DescriptionWidget(
                    text: 'Luram Epsum',
                    text1: 'Subtotal',
                    text2: getSubTotalPrice(
                      rate: int.parse(
                          widget.invoiceModel.addItem![0].cost.toString()),
                      quantity: int.parse(
                          widget.invoiceModel.addItem![0].quantity.toString()),
                      discountPrice: int.parse(
                          widget.invoiceModel.discountPrice!.value.toString()),
                    ).toString(),
                    color1: AppColors.blackColor,
                    hasFirst: false,
                  ),
                  VerticalHeight(
                    height: 5,
                  ),
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
                              rate: int.parse(widget
                                  .invoiceModel.addItem![0].cost
                                  .toString()),
                              quantity: int.parse(widget
                                  .invoiceModel.addItem![0].quantity
                                  .toString()),
                              discountPrice: int.parse(widget
                                  .invoiceModel.discountPrice!.value
                                  .toString()),
                            ),
                            tax: int.parse(
                                widget.invoiceModel.tax!.rate.toString()))
                        .toString(),
                    color1: AppColors.blackColor,
                    hasFirst: false,
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
                      label: widget.invoiceModel.bankDetails!.bankTransfer
                          .toString(),
                      fontSize: 12),
                  VerticalHeight(
                    height: 8,
                  ),
                  DynamicFontSize(
                      label: widget.invoiceModel.bankDetails!.email.toString(),
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

  int getSubTotalPrice(
      {required int rate, required int quantity, required int discountPrice}) {
    print(rate);
    print(quantity);
    print(discountPrice);
    return (rate * quantity) - discountPrice;
  }

  int getTotalPrice({required int subTotal, required int tax}) {
    return subTotal * tax;
  }
}
