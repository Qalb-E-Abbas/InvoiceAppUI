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
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.primeryColor,
            currentIndex: _selectedTabIndex,
            onTap: _changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Assets.imagesAudience),color: Colors.white,),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Assets.imagesAudience),color: Colors.white,size: 25,),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Assets.imagesChart),color: Colors.white,),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Assets.imagesSettings,),color: Colors.white,), title: Text('')),
            ],
          ),
        ));
  }
}