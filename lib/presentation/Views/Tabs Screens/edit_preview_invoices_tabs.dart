import 'package:flutter/material.dart';
import 'package:invoiceapp/presentation/Views/previewinVoice.dart';
import 'package:invoiceapp/presentation/common/custom_appBar.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

import '../editinvoicescreen.dart';

class EditPreviewInvoiceTabs extends StatefulWidget {
  final InvoiceModel invoiceModel;

  EditPreviewInvoiceTabs({required this.invoiceModel});

  @override
  _EditPreviewInvoiceTabsState createState() => _EditPreviewInvoiceTabsState();
}

class _EditPreviewInvoiceTabsState extends State<EditPreviewInvoiceTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            CustomAppBar(
              text: "Rechnung",
              isClient: true,
              invoiceID: widget.invoiceModel.docID.toString(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Rechnung bearbeiten',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Vorschaurechnung',
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.67,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: TabBarView(
                controller: _tabController,
                children: [
                  EditInvoicePage(
                    invoiceModel: widget.invoiceModel,
                  ),
                  PreviewInvoiceScreen(
                    invoiceModel: widget.invoiceModel,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
