import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/Views/Bottom%20Navigation/bottomNavigation.dart';
import 'package:invoiceapp/Views/addclient.dart';
import 'package:invoiceapp/application/client_provider.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/elements/loading_widget.dart';
import 'package:invoiceapp/elements/noData.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';
import 'package:invoiceapp/infratstrucutre/services/client_services.dart';
import 'package:invoiceapp/infratstrucutre/services/invoice_services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class DisplayMyClientsView extends StatefulWidget {
  @override
  _DisplayMyClientsViewState createState() => _DisplayMyClientsViewState();
}

class _DisplayMyClientsViewState extends State<DisplayMyClientsView> {
  var _clientNameController = TextEditingController();
  ClientServices _clientServices = ClientServices();
  String deviceID = "";
  bool isLoading = false;
  InvoiceServices _invoiceServices = InvoiceServices();

  @override
  initState() {
    getDeviceID().then((value) {
      deviceID = value!;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addClient = Provider.of<AddClientProvider>(context);
    var user = Provider.of<UserProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return await Get.offAll(() => BottomTab());
      },
      child: LoadingOverlay(
        isLoading: isLoading,
        progressIndicator: LoadingWidget(),
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          floatingActionButton: CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddClientScreen()));
              },
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.add),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Kunde",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalHeight(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Kunde",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        VerticalHeight(
                          height: 10,
                        ),
                        StreamProvider.value(
                          value: _clientServices
                              .streamMyClient(user.getUserDetails().docID!),
                          initialData: [ClientModel()],
                          builder: (context, child) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    context.watch<List<ClientModel>>().length,
                                itemBuilder: (context, i) {
                                  return context
                                          .watch<List<ClientModel>>()
                                          .isNotEmpty
                                      ? context
                                                  .watch<List<ClientModel>>()[0]
                                                  .docId ==
                                              null
                                          ? LoadingWidget()
                                          : Card(
                                              elevation: 3,
                                              child: ListTile(
                                                  title: Text(context
                                                      .watch<
                                                          List<
                                                              ClientModel>>()[i]
                                                      .name
                                                      .toString())),
                                            )
                                      : NoData();
                                });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
