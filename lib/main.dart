import 'package:flutter/material.dart';
import 'package:invoiceapp/Model/dart/bottomNavigation.dart';
import 'package:invoiceapp/Ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomTab(),

    );
  }
}


