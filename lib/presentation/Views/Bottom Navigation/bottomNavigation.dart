import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoiceapp/presentation/Views/Tabs%20Screens/home_tabs.dart';
import 'package:invoiceapp/presentation/Views/Tabs%20Screens/report_screens_tabs.dart';
import 'package:invoiceapp/presentation/Views/businessdetail.dart';
import 'package:invoiceapp/presentation/Views/chooseclient1.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/presentation/elements/navigation_dialog.dart';
import 'package:invoiceapp/generated/assets.dart';

class BottomTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTab();
  }
}

class _BottomTab extends State<BottomTab> {
  int _selectedTabIndex = 0;

  List _pages = [
    HomeScreen(),
    DisplayMyClientsView(),
    ReportScreenTabs(),
    BusinessDetailScreen(),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
      print("index..." + index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showNavigationDialog(context,
            message: "Do you really want to exit from app?",
            buttonText: "Yes", navigation: () {
          exit(0);
        }, secondButtonText: "No", showSecondButton: true);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(child: _pages[_selectedTabIndex]),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45), topLeft: Radius.circular(45)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            // <-- HERE
            showUnselectedLabels: false,
            backgroundColor: AppColors.primaryColor,
            currentIndex: _selectedTabIndex,
            onTap: _changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('images/price-list.png'),
                  color: Colors.white,
                  size: 27,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.imagesCustomer),
                  color: Colors.white,
                  size: 27,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.imagesChart),
                  color: Colors.white,
                  size: 25,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      Assets.imagesSettings,
                    ),
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text('')),
            ],
          ),
        ));
  }
}
