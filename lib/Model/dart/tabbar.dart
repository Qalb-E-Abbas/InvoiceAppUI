import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/invoices.dart';
import 'package:invoiceapp/Ui/outstanding.dart';
import 'package:invoiceapp/Ui/paidinvoice.dart';
import 'package:invoiceapp/constant.dart';
const double borderRadius = 4.0;
class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with TickerProviderStateMixin{

   late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    text: 'ALl Invoices',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Outstanding',
                  ),
                  Tab(
                    text: 'Pad Invoices',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  ALLInvoiceScreen(),

                  // second tab bar view widget
                  OutStandingScreen(),
                  PaidInvoiceScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}
