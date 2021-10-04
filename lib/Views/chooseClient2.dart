import 'package:flutter/material.dart';
import 'package:invoiceapp/Views/addclient.dart';
import 'package:invoiceapp/Views/payment_instructions.dart';
import 'package:invoiceapp/application/client_provider.dart';
import 'package:invoiceapp/application/helpers/device_info.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/common/vertical_height.dart';
import 'package:invoiceapp/configurations/AppColors.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';
import 'package:invoiceapp/infratstrucutre/services/client_services.dart';
import 'package:provider/provider.dart';

class ChooseClient2 extends StatefulWidget {
  const ChooseClient2({Key? key}) : super(key: key);

  @override
  _ChooseClient2State createState() => _ChooseClient2State();
}

class _ChooseClient2State extends State<ChooseClient2> {
  var _clientNameController = TextEditingController();
  ClientServices _clientServices = ClientServices();
  String deviceID = "";

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
    return Scaffold(
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
              CustomAppBar(text: "Client", isClient: true),
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
                        "Clients",
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
                      value: _clientServices.streamMyClient(deviceID),
                      initialData: [ClientModel()],
                      builder: (context, child) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                context.watch<List<ClientModel>>().length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentInstructionScreen()));

                                    addClient.saveClient(ClientModel(
                                      name: context
                                          .read<List<ClientModel>>()[i]
                                          .name,
                                      email: context
                                          .read<List<ClientModel>>()[i]
                                          .email,
                                      deviceID: context
                                          .read<List<ClientModel>>()[i]
                                          .deviceID,
                                      fax: context
                                          .read<List<ClientModel>>()[i]
                                          .fax,
                                      number: context
                                          .read<List<ClientModel>>()[i]
                                          .number,
                                      address: context
                                          .read<List<ClientModel>>()[i]
                                          .address,
                                      docId: context
                                          .read<List<ClientModel>>()[i]
                                          .docId,
                                    ));
                                  },
                                  child: ListTile(
                                      title: Text(context
                                          .watch<List<ClientModel>>()[i]
                                          .name
                                          .toString())));
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
    );
  }
}
