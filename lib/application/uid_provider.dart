import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/infratstrucutre/models/business_model.dart';

class UserProvider extends ChangeNotifier {
  BusinessModel _businessModel = BusinessModel();

  void saveUserDetails(BusinessModel businessModel) {
    _businessModel = businessModel;
    notifyListeners();
  }

  BusinessModel getUserDetails() => _businessModel;
}
