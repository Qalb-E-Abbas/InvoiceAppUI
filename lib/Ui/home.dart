import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/Model/dart/tabbar.dart';
import 'package:invoiceapp/Widget/Appbar.dart';
import 'package:invoiceapp/constant.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

            onPressed: (){},
            backgroundColor: AppColors.primeryColor,
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
                  child: TabBarScreen(),
                ),

              ],
            ),
          ),
        ));
  }
}
