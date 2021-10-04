import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class AddDiscountProvider extends ChangeNotifier {
  DiscountPrice _discountPrice = DiscountPrice();

  void saveDiscount(DiscountPrice discountPrice) {
    _discountPrice = discountPrice;
    notifyListeners();
  }

  DiscountPrice getDiscount() => _discountPrice;
}
