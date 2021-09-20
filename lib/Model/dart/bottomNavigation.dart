import 'package:flutter/material.dart';
import 'package:invoiceapp/Views/businessdetail.dart';
import 'package:invoiceapp/Views/edit_preview_invoices_tabs.dart';
import 'package:invoiceapp/Views/home.dart';
import 'package:invoiceapp/Views/report_screens_tabs.dart';


import 'package:invoiceapp/configurations/AppColors.dart';
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
    EditPreviewInvoiceTabs(),
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

    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Center(child: _pages[_selectedTabIndex]),

      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              topLeft: Radius.circular(45)),

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,   // <-- HERE
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
                icon: ImageIcon(AssetImage(Assets.imagesCustomer),color: Colors.white,size: 27,),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Assets.imagesCustomer),color: Colors.white,size: 27,),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Assets.imagesChart),color: Colors.white,size: 25,),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Assets.imagesSettings,),color: Colors.white,size: 25,), title: Text('')),
            ],
          ),
        ));
  }
}