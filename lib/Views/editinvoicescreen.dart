import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoiceapp/Views/adddiscount.dart';
import 'package:invoiceapp/Views/additems.dart';
import 'package:invoiceapp/Views/addtax.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/additem_container.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/invoiceTo_container.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/invoo1_container.dart';
import 'package:invoiceapp/elements/editInvoiceScreen_boxes/payment_instruction_container.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class EditInvoicePage extends StatefulWidget {
  final InvoiceModel invoiceModel;

  const EditInvoicePage({Key? key, required this.invoiceModel})
      : super(key: key);

  @override
  _EditInvoicePageState createState() => _EditInvoicePageState();
}

class _EditInvoicePageState extends State<EditInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            invoo1_container(
              invoiceID: widget.invoiceModel.docID!,
              note: widget.invoiceModel.description.toString(),
              ClientName: widget.invoiceModel.invoiceId.toString(),
              text: "Date",
              texdate: DateFormat.yMEd()
                  .format(DateTime.parse(widget.invoiceModel.date.toString())),
              text1: "Due Date",
              text2: widget.invoiceModel.dueDate.toString(),
            ),
            VerticalHeight(
              height: 5,
            ),
            InvoiceToContainer(
              ClientName: "Invoice to:",
              invoiceID: widget.invoiceModel.docID.toString(),
              clientModel: widget.invoiceModel.clientModel!,
              text: widget.invoiceModel.clientModel!.name.toString(),
              text1: widget.invoiceModel.clientModel!.email.toString(),
            ),
            VerticalHeight(
              height: 15,
            ),
            AddItemContainer(
              onTap: () {
                Get.to(() => AddItemsScreen(
                      isUpdateView: true,
                      invoiceID: widget.invoiceModel.docID.toString(),
                      addItem: widget.invoiceModel.addItem!,
                    ));
              },
              isDiscount: false,
              text3: "Items",
              text4: "Tap edit icon to edit items",
              text5: "price: ${widget.invoiceModel.totalCost.toString()}",
            ),
            AddItemContainer(
              onTap: () {
                Get.to(() => AddDiscountScreen(
                    isUpdateView: true,
                    invoiceID: widget.invoiceModel.docID.toString(),
                    discountPrice: widget.invoiceModel.discountPrice!));
              },
              isDiscount: true,
              text3: 'Discount',
              text4: widget.invoiceModel.discountPrice!.value.toString(),
              text5: "",
            ),
            AddItemContainer(
              onTap: () {
                Get.to(() => AddTaxScreen(
                      isUpdateView: true,
                      inoviceID: widget.invoiceModel.docID.toString(),
                      tax: widget.invoiceModel.tax!,
                    ));
              },
              isDiscount: false,
              text3: "Add tax",
              text4: widget.invoiceModel.tax!.name.toString(),
              text5: widget.invoiceModel.tax!.rate.toString(),
            ),
            PaymentInstructionContainer(
              invoiceID: widget.invoiceModel.docID.toString(),
              bankDetails: widget.invoiceModel.bankDetails!,
              text: "Payment instruction",
              Client: widget.invoiceModel.bankDetails!.other!.toString(),
              text2: "Edit information",
            ),
            VerticalHeight(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
