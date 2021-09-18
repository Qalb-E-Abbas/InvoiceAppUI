import 'package:flutter/material.dart';
import 'package:invoiceapp/Ui/reportclient.dart';
import 'package:invoiceapp/Ui/reportpaid.dart';
const double borderRadius = 4.0;
class ReportTabBar extends StatefulWidget {
  const ReportTabBar({Key? key}) : super(key: key);

  @override
  _ReportTabBarState createState() => _ReportTabBarState();
}

class _ReportTabBarState extends State<ReportTabBar> with TickerProviderStateMixin{
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    text: 'Paid',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Client',
                  ),

                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ReportClientScreen(),
                  ReportPaidScreen(),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

