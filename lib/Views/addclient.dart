import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/chooseClient2.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/common/Textformfeild.dart';
import 'package:invoiceapp/common/button.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/dynamicFont.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/navigation_dialog.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';
import 'package:invoiceapp/infratstrucutre/services/client_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  var _clientNameController = TextEditingController();
  var _numberController = TextEditingController();
  var _emailController = TextEditingController();
  var _faxController = TextEditingController();
  var _addressController = TextEditingController();
  ClientServices _clientServices = ClientServices();

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<AppState>(context);
    return Scaffold(
      body: LoadingOverlay(
        isLoading: status.getStateStatus() == StateStatus.IsBusy,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: "Add New client", isClient: false),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DynamicFontSize(
                  fontSize: 16,
                  label: "Client Name",
                  fontWeight: FontWeight.w700,
                ),
              ),
              VerticalHeight(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _clientNameController,
                  hint: "Enter client name",
                  isNumber: false),
              VerticalHeight(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DynamicFontSize(
                  fontSize: 16,
                  label: "Email",
                  fontWeight: FontWeight.w700,
                ),
              ),
              VerticalHeight(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _emailController,
                  hint: "Enter email",
                  isNumber: false),
              VerticalHeight(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DynamicFontSize(
                  fontSize: 16,
                  label: "Phone Number",
                  fontWeight: FontWeight.w700,
                ),
              ),
              VerticalHeight(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _numberController,
                  hint: "Enter phone number",
                  isNumber: false),
              VerticalHeight(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DynamicFontSize(
                  fontSize: 16,
                  label: "Fax Number",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _faxController,
                  hint: "Enter fax number",
                  isNumber: false),
              VerticalHeight(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DynamicFontSize(
                  fontSize: 16,
                  label: "Address",
                  fontWeight: FontWeight.w700,
                ),
              ),
              VerticalHeight(
                height: 10,
              ),
              Utiles.getStyledTextField(
                  controller: _addressController,
                  hint: "Enter address",
                  isNumber: false),
              VerticalHeight(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Button(
                    pressed: () {
                      getDeviceID().then((value) {
                        _clientServices.createClient(
                          context,
                          model: ClientModel(
                            name: _clientNameController.text,
                            email: _emailController.text,
                            number: _numberController.text,
                            fax: _faxController.text,
                            address: _addressController.text,
                            deviceID: value.toString(),
                          ),
                          deviceID: value.toString(),
                        );
                      });

                      if (status.getStateStatus() == StateStatus.IsFree) {
                        showNavigationDialog(context,
                            message: "Client added successfully.",
                            buttonText: "Okay", navigation: () {
                          Get.to(() => ChooseClient2());
                        },
                            secondButtonText: "secondButtonText",
                            showSecondButton: false);
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddClientScreen()));
                    },
                    text: "Save Client",
                    colors: AppColors.primaryColor,
                    bordercolor: AppColors.primaryColor,
                    textcolor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
