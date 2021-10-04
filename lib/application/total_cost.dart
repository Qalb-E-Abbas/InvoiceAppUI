import 'package:flutter/cupertino.dart';

class TotalCostProvider extends ChangeNotifier {
  String totalCost = "";

  void saveTotalCost(String _totalCost) {
    totalCost = _totalCost;
    notifyListeners();
  }

  String getTotalCost() => totalCost;
}
