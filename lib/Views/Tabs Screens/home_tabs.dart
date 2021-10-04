import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/additems.dart';
import 'package:invoiceapp/Views/paidinvoice.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/invoices_list_screens/Appbar.dart';

import '../all_invoices.dart';
import '../outstanding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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

  final PageController _pageController = PageController();
  int activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: CircleAvatar(
          radius: 33,
          backgroundColor: Colors.white,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddItemsScreen());
            },
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.add),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //physics: const ClampingScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                AppBarBox(text: "Invoices"),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Column(
                        children: [
                          // give the tab bar a height [can change hheight to preferred height]
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                // first tab [you can add an icon using the icon property]
                                Tab(
                                  text: 'All Invoices',
                                ),

                                // second tab [you can add an icon using the icon property]
                                Tab(
                                  text: 'Outstanding',
                                ),
                                Tab(
                                  text: 'Paid Invoice',
                                ),
                              ],
                            ),
                          ),
                          // tab bar view here
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                ALLInvoiceScreen(),
                                OutStandingScreen(),
                                PaidInvoiceScreen(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
