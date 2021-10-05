import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';
import 'package:provider/provider.dart';

class ClientServices {
  CollectionReference<Map<String, dynamic>> clientCollection =
      FirebaseFirestore.instance.collection('clientsData');

  ///Create Client
  Future<void> createClient(BuildContext context,
      {required ClientModel model, required String deviceID}) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('clientsData').doc();
    return await docRef
        .set(model.toJson(docID: docRef.id, deviceID: deviceID))
        .then((value) {
      Provider.of<AppState>(context, listen: false)
          .stateStatus(StateStatus.IsFree);
    });
  }

  ///Get Clients
  Stream<List<ClientModel>> streamMyClient(String uid) {
    return clientCollection.where('deviceID', isEqualTo: uid).snapshots().map(
        (event) =>
            event.docs.map((e) => ClientModel.fromJson(e.data())).toList());
  }

  ///Get Specific Client
  Stream<ClientModel> streamSpecificClient(String docID) {
    return clientCollection
        .doc(docID)
        .snapshots()
        .map((event) => ClientModel.fromJson(event.data()!));
  }

  ///Delete Clients
  Future<void> deleteClients(BuildContext context, String docID) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    await clientCollection.doc(docID).delete();
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsFree);
  }
}
