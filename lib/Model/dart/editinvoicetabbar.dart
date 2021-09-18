import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/editinvoicescreen.dart';
import 'package:invoiceapp/Ui/invoices.dart';
import 'package:invoiceapp/Ui/outstanding.dart';
import 'package:invoiceapp/Ui/notes.dart';
import 'package:invoiceapp/Ui/previewinVoice.dart';
const double borderRadius = 4.0;
class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>with TickerProviderStateMixin {
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
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(

        child: Container(
          height: MediaQuery.of(context).size.height,
          color:  Colors.white,
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    borderRadius,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        borderRadius
                    ),
                    color: Colors.green,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Edit Invoice',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Preview invoice',
                    ),

                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    EditInvoicePage(),

                    // second tab bar view widget
                    InvoiceView(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
