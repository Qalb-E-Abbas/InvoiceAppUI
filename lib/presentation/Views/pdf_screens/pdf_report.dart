import 'dart:io';

import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart';
import 'package:invoiceapp/presentation/Views/pdf_screens/pdf_viewer_page.dart';
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
            child: Text('Rechnung',
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
                      Text(
                        'Rechnung',
                        textScaleFactor: 2,
                        style: TextStyle(
                            color: PdfColor.fromHex('#56ae6a'),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ])),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Header(
                level: 1,
                text: 'Rechnung von',
                textStyle: TextStyle(
                    color: PdfColor.fromHex('#56ae6a'),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Header(
                level: 1,
                text: 'Rechnung an',
                textStyle: TextStyle(
                    color: PdfColor.fromHex('#56ae6a'),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ]),
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
            Text('Rechnung # ${invoiceModel.invoiceId.toString()}',
                style: TextStyle(
                    color: PdfColor.fromHex('#56ae6a'),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                textScaleFactor: 1),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Rechnungsdatum',
                textScaleFactor: 1,
                style: TextStyle(
                    color: PdfColor.fromHex('#56ae6a'),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                'Zahlbar bis',
                textScaleFactor: 1,
                style: TextStyle(
                    color: PdfColor.fromHex('#56ae6a'),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(
                text: DateFormat.yMEd()
                    .format(DateTime.parse(invoiceModel.date.toString()))
                    .toString(),
              ),
              Paragraph(
                text: DateFormat.yMEd()
                    .format(DateTime.parse(invoiceModel.dueDate.toString()))
                    .toString(),
              ),
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
                      Text('Beschreibung', textScaleFactor: 1),
                      Text('Einzelpreis', textScaleFactor: 1),
                      Text('Menge', textScaleFactor: 1),
                      Text('Amount', textScaleFactor: 1),
                    ])),
            ...invoiceModel.addItem!
                .map(
                  (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Paragraph(text: e.name.toString()),
                        Paragraph(text: e.cost.toString()),
                        Paragraph(text: e.quantity.toString()),
                        Paragraph(
                          text:
                              "${int.parse(e.cost.toString()) * int.parse(e.quantity.toString())}"
                                  .toString(),
                        ),
                      ]),
                )
                .toList(),
            Divider(),
            if (invoiceModel.discountPrice!.value != "0")
              if (invoiceModel.discountPrice!.type == true)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Paragraph(text: "Rabatt"),
                      Paragraph(
                          text: invoiceModel.discountPrice!.value.toString() +
                              " %"),
                    ]),
            if (invoiceModel.discountPrice!.value != "0")
              if (invoiceModel.discountPrice!.type != true)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Paragraph(text: "Rabatt"),
                      Paragraph(
                          text: invoiceModel.discountPrice!.value.toString()),
                    ]),
            if (invoiceModel.discountPrice!.value != "0")
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Paragraph(text: "Zwischensumme"),
                Paragraph(text: subTotal),
              ]),
            if (invoiceModel.tax!.rate != "0")
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Paragraph(text: "MwSt"),
                Paragraph(text: invoiceModel.tax!.rate.toString()),
              ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "Gesamt"),
              Paragraph(text: total),
            ]),
            Divider(),
            Header(
              level: 1,
              text: 'Zahlungsinformationen',
              textStyle: TextStyle(
                  color: PdfColor.fromHex('#56ae6a'),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Paragraph(text: invoiceModel.bankDetails!.other.toString()),
            SizedBox(
              height: 20,
            ),
            Header(
              level: 1,
              text: 'Anmerkungen',
              textStyle: TextStyle(
                  color: PdfColor.fromHex('#56ae6a'),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
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
