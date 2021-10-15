import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/Views/sign_up.dart';
import 'package:invoiceapp/application/auth_state.dart';
import 'package:invoiceapp/application/errorStrings.dart';
import 'package:invoiceapp/application/loginBusinessLogic.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/configurations/enums.dart';
import 'package:invoiceapp/elements/app_button.dart';
import 'package:invoiceapp/elements/auth_text_field.dart';
import 'package:invoiceapp/elements/dialog.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/infratstrucutre/services/authServices.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'forgot_your_passward.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool isObscure = true;
  LoginBusinessLogic data = LoginBusinessLogic();
  final _formKey = GlobalKey<FormState>();
  var node;

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthServices>(context);
    node = FocusScope.of(context);
    return Scaffold(
      body: LoadingOverlay(
        isLoading: auth.status == LoginStatus.Authenticating,
        progressIndicator: LoadingWidget(),
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                Booster.verticalSpace(100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Booster.dynamicFontSize(
                        label: "Einloggen",
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1A15),
                      )),
                ),
                Booster.verticalSpace(11),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Booster.dynamicFontSize(
                        label: "Verwenden Sie Ihre E-Mail und Ihr Passwort",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6B6E74),
                      )
                    ],
                  ),
                ),
                Booster.verticalSpace(36),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Booster.dynamicFontSize(
                          label: "Email",
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ],
                  ),
                ),
                Booster.verticalSpace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextField(
                      controller: _emailController,
                      validator: (val) =>
                          val.isEmpty ? "Feld darf nicht leer sein" : null,
                    ),
                  ),
                ),
                Booster.verticalSpace(36),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Booster.dynamicFontSize(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          label: "Passwort"),
                    ],
                  ),
                ),
                Booster.verticalSpace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextField(
                      controller: _pwdController,
                      isPasswordField: true,
                      validator: (val) =>
                          val.isEmpty ? "Feld darf nicht leer sein" : null,
                    ),
                  ),
                ),
                Booster.verticalSpace(47),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AppButton(
                    text: "Einloggen",
                    onTap: () {
                      print("Called");
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      loginUser(
                          context: context,
                          data: data,
                          email: _emailController.text,
                          auth: auth,
                          password: _pwdController.text);
                    },
                  ),
                ),
                Booster.verticalSpace(67),
                _gettext(text: "Passwort vergessen"),
                Booster.verticalSpace(12),
                _gettextrow(text: "Kein Konto", text1: "Registrieren"),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

loginUser(
    {required BuildContext context,
    required LoginBusinessLogic data,
    required String email,
    required AuthServices auth,
    required String password}) {
  data
      .loginUserLogic(
    context,
    email: email,
    password: password,
  )
      .then((val) async {
    if (auth.status == LoginStatus.Authenticated) {
      UserLoginStateHandler.saveUserLoggedInSharedPreference(true);
      Get.to(() => BottomTab());
    } else {
      showErrorDialog(context,
          message: Provider.of<ErrorString>(context, listen: false)
              .getErrorString());
    }
  });
}

_gettext({
  required String text,
}) {
  return InkWell(
    onTap: () {
      Get.to(ForgotPassward(), transition: Transition.cupertino);
    },
    child: Booster.dynamicFontSize(
        label: text,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black),
  );
}

_gettextrow({required String text, required String text1}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Booster.dynamicFontSize(
          label: text,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      Booster.horizontalSpace(3),
      InkWell(
        onTap: () {
          Get.to(SignUp(), transition: Transition.cupertino);
        },
        child: Booster.dynamicFontSize(
            label: text1,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            isUnderline: true),
      ),
    ],
  );
}

getTextFieldLabel(String text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
        color: Color(0xff3A3D46),
        letterSpacing: 0.5,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 10),
  );
}
