import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/application/update_logic.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/businessDetailsField.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/business_model.dart';
import 'package:invoiceapp/infratstrucutre/services/uploadFileServices.dart';
import 'package:invoiceapp/infratstrucutre/services/user_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({Key? key}) : super(key: key);

  @override
  _BusinessDetailScreenState createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  UserServices _businessServices = UserServices();
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _ownerController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  File? _file;
  String businessLogo = "";

  @override
  initState() {
    var user = Provider.of<UserProvider>(context, listen: false);
    _numberController =
        TextEditingController(text: user.getUserDetails().number);
    _nameController = TextEditingController(text: user.getUserDetails().name);
    _emailController = TextEditingController(text: user.getUserDetails().email);
    _websiteController =
        TextEditingController(text: user.getUserDetails().website);
    _ownerController =
        TextEditingController(text: user.getUserDetails().ownerName);
    _addressController =
        TextEditingController(text: user.getUserDetails().address);

    super.initState();
  }

  UpdateUserData updateUserData = UpdateUserData();

  UploadFileServices _uploadFileServices = UploadFileServices();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: LoadingWidget(),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(text: "Business Details", isClient: false),
                VerticalHeight(
                  height: 35,
                ),
                if (_file == null)
                  InkWell(
                    onTap: () => getFile(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CachedNetworkImage(
                        imageUrl: user.getUserDetails().logo.toString(),
                        placeholder: (context, url) => LoadingWidget(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                if (_file != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () => getFile(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.19,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Center(
                          child: _file == null
                              ? Text(
                                  'Business Logo',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              : Image.file(_file!),
                        ),
                      ),
                    ),
                  ),
                VerticalHeight(
                  height: 20,
                ),
                BusinessDetailsField(
                    label: "Business Name",
                    controller: _nameController,
                    validator: (val) {}),
                BusinessDetailsField(
                    label: "Owner Name",
                    controller: _ownerController,
                    validator: (val) {}),
                BusinessDetailsField(
                    label: "Business Number",
                    controller: _numberController,
                    validator: (val) {}),
                BusinessDetailsField(
                    label: "Address",
                    controller: _addressController,
                    validator: (val) {}),
                BusinessDetailsField(
                    label: "Business Website",
                    controller: _websiteController,
                    validator: (val) {}),
                VerticalHeight(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Button(
                      pressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        isLoading = true;
                        setState(() {});
                        var user =
                            Provider.of<UserProvider>(context, listen: false);
                        if (_file != null) {
                          _uploadFileServices
                              .getUrl(context, file: _file!)
                              .then((url) {
                            updateUserData.updateUserData(
                              context,
                              model: BusinessModel(
                                  logo: url,
                                  number: _numberController.text,
                                  name: _nameController.text,
                                  ownerName: _ownerController.text,
                                  email: _emailController.text,
                                  address: _addressController.text,
                                  website: _websiteController.text,
                                  docID: user.getUserDetails().docID),
                            );
                          }).then((value) {
                            isLoading = false;
                            setState(() {});
                            showNavigationDialog(context,
                                message:
                                    "Your Business details has been updated successfully.",
                                buttonText: "Okay", navigation: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomTab()),
                                  (route) => false);
                            },
                                secondButtonText: "secondButtonText",
                                showSecondButton: false);
                          });
                        } else {
                          updateUserData
                              .updateUserData(
                            context,
                            model: BusinessModel(
                                logo: user.getUserDetails().logo,
                                number: _numberController.text,
                                name: _nameController.text,
                                ownerName: _ownerController.text,
                                email: _emailController.text,
                                address: _addressController.text,
                                website: _websiteController.text,
                                docID: user.getUserDetails().docID),
                          )
                              .then((value) {
                            isLoading = false;
                            setState(() {});
                            showNavigationDialog(context,
                                message:
                                    "Your Business details has been updated successfully.",
                                buttonText: "Okay", navigation: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomTab()),
                                  (route) => false);
                            },
                                secondButtonText: "secondButtonText",
                                showSecondButton: false);
                          });
                        }
                      },
                      text: "Save",
                      colors: AppColors.primaryColor,
                      bordercolor: AppColors.primaryColor,
                      textcolor: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImagePicker _imagePicker = ImagePicker();

  Future getFile() async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40);

    setState(() {
      if (pickedFile != null) {
        _file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
