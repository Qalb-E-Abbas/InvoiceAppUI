import 'dart:io';

import 'package:flutter/material.dart' as material;
import 'package:invoiceapp/Views/pdf_screens/pdf_viewer_page.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

reportView(context,
    {required InvoiceModel invoiceModel,
    required String subTotal,
    required String total}) async {
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            // decoration: const BoxDecoration(
            // border:
            //     BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('INVOICE',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('INVOICE', textScaleFactor: 2),
                    ])),
            Text(invoiceModel.business!.name.toString(), textScaleFactor: 3),
            SizedBox(height: 20),
            Text('INVOICE # ${invoiceModel.invoiceId.toString()}',
                textScaleFactor: 2),
            Header(
                level: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Header(level: 1, text: 'Invoice From'),
                      Header(level: 1, text: 'Invoice To'),
                    ])),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: invoiceModel.business!.ownerName.toString()),
              Paragraph(text: invoiceModel.clientModel!.name.toString()),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: invoiceModel.business!.number.toString()),
              Paragraph(text: invoiceModel.clientModel!.number.toString()),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: invoiceModel.business!.email.toString()),
              Paragraph(text: invoiceModel.clientModel!.email.toString()),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: invoiceModel.business!.website.toString()),
              Paragraph(text: ""),
            ]),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Header(
                level: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date', textScaleFactor: 1),
                      Text('Due Date', textScaleFactor: 1),
                    ])),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: invoiceModel.date.toString()),
              Paragraph(text: invoiceModel.dueDate.toString()),
            ]),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Header(
                level: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Description', textScaleFactor: 1),
                      Text('Quantity', textScaleFactor: 1),
                      Text('Per Unit Cost', textScaleFactor: 1),
                    ])),
            ...invoiceModel.addItem!
                .map(
                  (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Paragraph(text: e.name.toString()),
                        Paragraph(text: e.quantity.toString()),
                        Paragraph(text: e.cost.toString()),
                      ]),
                )
                .toList(),
            Divider(),
            if (invoiceModel.discountPrice!.value != "0")
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Paragraph(text: "Discount"),
                Paragraph(text: invoiceModel.discountPrice!.value.toString()),
              ]),
            if (invoiceModel.discountPrice!.value != "0")
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Paragraph(text: "Sub Total"),
                Paragraph(text: subTotal),
              ]),
            if (invoiceModel.tax!.rate != "0")
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Paragraph(text: "Tax"),
                Paragraph(text: invoiceModel.tax!.rate.toString() + " %"),
              ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "Total"),
              Paragraph(text: total),
            ]),
            Divider(),
            Header(level: 1, text: 'Payment Info'),
            Paragraph(text: invoiceModel.bankDetails!.other.toString()),
            SizedBox(
              height: 20,
            ),
            Header(level: 1, text: 'Notes'),
            Paragraph(text: invoiceModel.description.toString()),
          ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/Invoice Details.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}
