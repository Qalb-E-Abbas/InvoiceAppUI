import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class AddPaymentProvider extends ChangeNotifier {
  BankDetails _bankDetails = BankDetails();

  void savePayment(BankDetails bankDetails) {
    _bankDetails = bankDetails;
    notifyListeners();
  }

  BankDetails getPayment() => _bankDetails;
}
