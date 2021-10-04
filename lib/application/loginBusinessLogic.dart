import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/configurations/backEdnConfigs.dart';
import 'package:invoiceapp/configurations/enums.dart' as config;
import 'package:invoiceapp/infratstrucutre/services/authServices.dart';
import 'package:invoiceapp/infratstrucutre/services/user_services.dart';
import 'package:provider/provider.dart';

import 'errorStrings.dart';

class LoginBusinessLogic {
  UserServices _userServices = UserServices();
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future loginUserLogic(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    var _authServices = Provider.of<AuthServices>(context, listen: false);
    var _error = Provider.of<ErrorString>(context, listen: false);
    var login = Provider.of<AuthServices>(context, listen: false);
    var userDetails = Provider.of<UserProvider>(context, listen: false);
    await login
        .signIn(context, email: email, password: password)
        .then((User? user) {
      if (user != null) {
        _userServices.streamUserData(user.uid).map((profileUser) async {
          if (profileUser.docID == null) {
            _authServices.setState(config.LoginStatus.Unauthenticated);
          } else {
            userDetails.saveUserDetails(profileUser);
            await _flutterSecureStorage.write(
                key: BackEndConfigs.userDetailsLocalStorage,
                value:
                    profileUser.toJson(docID: profileUser.docID!).toString());
          }
        }).toList();
      } else {}
    });
  }
}
