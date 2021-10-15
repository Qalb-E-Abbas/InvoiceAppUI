import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/chooseclient1.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/application/uid_provider.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<AppState>(context);
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: LoadingOverlay(
        isLoading: status.getStateStatus() == StateStatus.IsBusy,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(text: "Neuen Kunden hinzufügen", isClient: false),
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
                    validator: (val) =>
                        val.isEmpty ? "Feld darf nicht leer sein" : null,
                    controller: _clientNameController,
                    hint: "Geben Sie den Kundennamen ein",
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
                    validator: (val) =>
                        !val.isEmail ? "Kindly provide valid email" : null,
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
                    label: "Telefonnummer",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalHeight(
                  height: 10,
                ),
                Utiles.getStyledTextField(
                    controller: _numberController,
                    validator: (val) {},
                    hint: "Telefonnummer",
                    isNumber: true),
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
                    validator: (val) {},
                    hint: "Enter fax number",
                    isNumber: true),
                VerticalHeight(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DynamicFontSize(
                    fontSize: 16,
                    label: "Adresse",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalHeight(
                  height: 10,
                ),
                Utiles.getStyledTextField(
                    controller: _addressController,
                    validator: (val) {},
                    hint: "Enter address",
                    isNumber: false),
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
                        await getDeviceID().then((value) async {
                          await _clientServices.createClient(
                            context,
                            model: ClientModel(
                              name: _clientNameController.text,
                              email: _emailController.text,
                              number: _numberController.text,
                              fax: _faxController.text,
                              address: _addressController.text,
                              deviceID: user.getUserDetails().docID!,
                            ),
                            deviceID: user.getUserDetails().docID!,
                          );
                        }).then((value) {
                          if (status.getStateStatus() == StateStatus.IsFree) {
                            showNavigationDialog(context,
                                message: "Client added successfully.",
                                buttonText: "Okay", navigation: () {
                              Get.to(() => DisplayMyClientsView());
                            },
                                secondButtonText: "secondButtonText",
                                showSecondButton: false);
                          }
                        });
                      },
                      text: "Speichern",
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
}
