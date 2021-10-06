import 'dart:io';

import 'package:flutter/material.dart' as material;
import 'package:invoiceapp/Views/pdf_screens/pdf_viewer_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

reportView(context) async {
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
                      PdfLogo()
                    ])),
            Text('WAM TECH', textScaleFactor: 3),
            SizedBox(height: 20),
            Text('INVOICE # 123', textScaleFactor: 2),
            Header(
                level: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Header(level: 1, text: 'Invoice From'),
                      Header(level: 1, text: 'Invoice To'),
                    ])),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "Muhammad Ali"),
              Paragraph(text: "Muhammad Ali"),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "+92-341-9527440"),
              Paragraph(text: "+92-341-9527440"),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "kustalics@gmail.com"),
              Paragraph(text: "kustalics@gmail.com"),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "www.wamtech.com"),
              Paragraph(text: "www.wamtech.com"),
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
                      Text('Recharge', textScaleFactor: 1),
                      Text('Date', textScaleFactor: 1),
                      Text('Due Date', textScaleFactor: 1),
                    ])),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Paragraph(text: "Dummy Data"),
              Paragraph(text: "12/12/2012"),
              Paragraph(text: "12/12/2012"),
            ]),
            Header(level: 1, text: 'Payment Info'),
            Paragraph(text: "Habib Bank Limited, Pakistan"),
            SizedBox(
              height: 20,
            ),
            Header(level: 1, text: 'Notes'),
            Paragraph(text: "Thanks for your business"),
            Paragraph(
                text:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
            Padding(padding: const EdgeInsets.all(10)),
            Table.fromTextArray(context: context, data: const <List<String>>[
              <String>['Year', 'Ipsum', 'Lorem'],
              <String>['2000', 'Ipsum 1.0', 'Lorem 1'],
              <String>['2001', 'Ipsum 1.1', 'Lorem 2'],
              <String>['2002', 'Ipsum 1.2', 'Lorem 3'],
              <String>['2003', 'Ipsum 1.3', 'Lorem 4'],
              <String>['2004', 'Ipsum 1.4', 'Lorem 5'],
              <String>['2004', 'Ipsum 1.5', 'Lorem 6'],
              <String>['2006', 'Ipsum 1.6', 'Lorem 7'],
              <String>['2007', 'Ipsum 1.7', 'Lorem 8'],
              <String>['2008', 'Ipsum 1.7', 'Lorem 9'],
            ]),
          ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}
