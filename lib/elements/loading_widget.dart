import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size: 35,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? AppColors.primaryColor : Color(0xAC8AD6FC),
          ),
        );
      },
    );
  }
}
