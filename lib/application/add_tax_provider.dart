import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class AddTaxProvider extends ChangeNotifier {
  Tax _tax = Tax();

  void saveTax(Tax tax) {
    _tax = tax;
    notifyListeners();
  }

  Tax getTax() => _tax;
}
