import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/configurations/backEdnConfigs.dart';
import 'package:invoiceapp/infratstrucutre/models/business_model.dart';
import 'package:invoiceapp/infratstrucutre/services/user_services.dart';
import 'package:provider/provider.dart';

class UpdateUserData {
  UserServices _userServices = UserServices();
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<void> updateUserData(BuildContext context,
      {required BusinessModel model}) async {
    var user = Provider.of<UserProvider>(context, listen: false);
    return await _userServices
        .updateUserData(context, model: model)
        .then((value) async {
      return await _userServices
          .streamUserData(model.docID!)
          .first
          .then((value) async {
        user.saveUserDetails(model);
        return await _flutterSecureStorage.write(
            key: BackEndConfigs.userDetailsLocalStorage,
            value: value.toJson(docID: value.docID!).toString());
      });
    });
  }
}
