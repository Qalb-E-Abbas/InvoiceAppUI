import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';

class AddItemProvider extends ChangeNotifier {
  List<AddItem> _addItem = [];

  void saveAddItem(AddItem addItem) {
    _addItem.add(addItem);
    notifyListeners();
  }

  List<AddItem> getAddItem() => _addItem;
}
