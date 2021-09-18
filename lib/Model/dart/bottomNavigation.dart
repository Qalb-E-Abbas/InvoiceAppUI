import 'package:flutter/material.dart';
import 'package:invoiceapp/Model/dart/tabbar.dart';
import 'package:invoiceapp/Ui/addclient.dart';
import 'package:invoiceapp/Ui/adddiscount.dart';
import 'package:invoiceapp/Ui/addtax.dart';
import 'package:invoiceapp/Ui/businessdetail.dart';
import 'package:invoiceapp/Ui/editinvice.dart';
import 'package:invoiceapp/Ui/home.dart';
import 'package:invoiceapp/Ui/payment.dart';
import 'package:invoiceapp/Ui/report.dart';
import 'package:invoiceapp/constant.dart';
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
    EditInvoiceScreen(),
    ReportScreen(),
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
              topRight: Radius.circular(45), topLeft: Radius.circular(45)),

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,   // <-- HERE
            showUnselectedLabels: false,
            backgroundColor: AppColors.primeryColor,
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