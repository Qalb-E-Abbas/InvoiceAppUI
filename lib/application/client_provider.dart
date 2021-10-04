import 'package:flutter/cupertino.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';

class AddClientProvider extends ChangeNotifier {
  ClientModel _clientModel = ClientModel();

  void saveClient(ClientModel clientModel) {
    _clientModel = clientModel;
    notifyListeners();
  }

  ClientModel getClient() => _clientModel;
}
