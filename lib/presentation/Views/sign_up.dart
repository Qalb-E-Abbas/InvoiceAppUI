import 'dart:io';

import 'package:booster/booster.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoiceapp/application/errorStrings.dart';
import 'package:invoiceapp/application/signUpBusinissLogic.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/presentation/elements/app_button.dart';
import 'package:invoiceapp/presentation/elements/auth_text_field.dart';
import 'package:invoiceapp/presentation/elements/dialog.dart';
import 'package:invoiceapp/presentation/elements/flushBar.dart';
import 'package:invoiceapp/presentation/elements/loading_widget.dart';
import 'package:invoiceapp/presentation/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/business_model.dart';
import 'package:invoiceapp/infratstrucutre/services/authServices.dart';
import 'package:invoiceapp/infratstrucutre/services/uploadFileServices.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import 'sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  AuthServices _authServices = AuthServices.instance();

  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  UploadFileServices _uploadFileServices = UploadFileServices();

  var node;

  File? image;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _pwdController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _websiteController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController _numberController = TextEditingController();
  TextEditingController _businessNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpBusinessLogic signUp = Provider.of<SignUpBusinessLogic>(context);
    var user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: isLoading,
          progressIndicator: LoadingWidget(),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                Booster.verticalSpace(80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Booster.dynamicFontSize(
                        label: "Registrieren",
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1A15),
                      )),
                ),
                Booster.verticalSpace(11),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Booster.dynamicFontSize(
                        label: "Benutzername verwenden",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6B6E74),
                      )),
                ),
                Booster.verticalSpace(44),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getTextFieldLabel('Benutzername verwenden'),
                    ],
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AuthTextField(
                    controller: _nameController,
                    validator: (val) =>
                        val.isEmpty ? "Feld darf nicht leer sein" : null,
                  ),
                ),
                Booster.verticalSpace(23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getTextFieldLabel('Firmenname'),
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextField(
                      controller: _businessNameController,
                      validator: (val) =>
                          val.isEmpty ? "Feld darf nicht leer sein" : null,
                    ),
                  ),
                ),
                Booster.verticalSpace(23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getTextFieldLabel('Webseite'),
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextField(
                        controller: _websiteController,
                        validator: (val) {
                          if (val.isNotEmpty) {
                            if (!val.isURL) {
                              return "Kindly provide valid url.";
                            } else {
                              return null;
                            }
                          } else {
                            return null;
                          }
                        }),
                  ),
                ),
                Booster.verticalSpace(23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getTextFieldLabel('Telefonnummer'),
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: _numberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        keyboardType: TextInputType.number,
                        validator: (val) =>
                            val!.isEmpty ? "Feld darf nicht leer sein" : null,
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.ltr,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffB4B4B4))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffB4B4B4))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffB4B4B4))),
                        ),
                      )),
                ),
                Booster.verticalSpace(23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getTextFieldLabel('Adresse'),
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextField(
                      controller: _addressController,
                      validator: (val) =>
                          val.isEmpty ? "Feld darf nicht leer sein" : null,
                    ),
                  ),
                ),
                Booster.verticalSpace(23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getTextFieldLabel('Email'),
                  ),
                ),
                Booster.verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextField(
                      controller: _emailController,
                      validator: (val) =>
                          !val.isEmail ? "Kindly enter valid Email." : null,
                    ),
                  ),
                ),
                Booster.verticalSpace(23),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getTextFieldLabel("Passwort"),
                  ),
                ),
                Booster.verticalSpace(10),
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
                Booster.verticalSpace(23),
                _getImagePicker(context),
                Booster.verticalSpace(37),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AppButton(
                      text: "Registrieren",
                      onTap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (image == null) {
                          getFlushBar(context,
                              title: "Kindly select image.",
                              icon: Icons.info_outline,
                              color: Colors.blue);
                          return;
                        }
                        isLoading = true;
                        setState(() {});
                        _signUpUser(
                            context: context, signUp: signUp, user: user);
                      },
                    )),
                Booster.verticalSpace(40),
                _gettextrow(
                    text: "Already have an account? ", text1: "Einloggen"),
                Booster.verticalSpace(40),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  _getImagePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.primaryColor,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Flexible(
                  child: Booster.dynamicFontSize(
                    label: image == null
                        ? "Attach Business Logo"
                        : image!.path.split('/').last,
                    fontSize: 16,
                    isAlignCenter: false,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () => getFile(),
                child: Icon(
                  Icons.attach_file,
                  color: AppColors.primaryColor,
                  size: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signUpUser(
      {required BuildContext context,
      required SignUpBusinessLogic signUp,
      required User? user}) {
    _uploadFileServices.getUrl(context, file: image!).then((value) {
      signUp
          .registerNewUser(
              email: _emailController.text,
              password: _pwdController.text,
              userModel: BusinessModel(
                  name: _businessNameController.text,
                  number: _numberController.text,
                  address: _addressController.text,
                  website: _websiteController.text,
                  ownerName: _nameController.text,
                  logo: value,
                  email: _emailController.text),
              context: context,
              user: user)
          .then((value) {
        if (signUp.status == SignUpStatus.Registered) {
          isLoading = false;
          setState(() {});
          showNavigationDialog(context,
              message: "Thanks for registration",
              buttonText: "Go to Login", navigation: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          }, secondButtonText: "", showSecondButton: false);
        } else if (signUp.status == SignUpStatus.Failed) {
          isLoading = false;
          setState(() {});
          print("Called");
          showErrorDialog(context,
              message: Provider.of<ErrorString>(context, listen: false)
                  .getErrorString());
        }
      });
    });
  }

  ImagePicker _imagePicker = ImagePicker();

  Future getFile() async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
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
          Get.to(SignIn(), transition: Transition.cupertino);
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
