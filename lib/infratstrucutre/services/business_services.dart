import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/infratstrucutre/models/business_model.dart';
import 'package:provider/provider.dart';

class BusinessServices {
  CollectionReference<Map<String, dynamic>> businessCollection =
      FirebaseFirestore.instance.collection('businessData');

  ///Create Business
  Future<void> updateBu(BuildContext context,
      {required BusinessModel model, required String deviceID}) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('businessData').doc();
    await docRef.set(model.toJson(docID: docRef.id));
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsFree);
  }

  ///Get Business
  Stream<List<BusinessModel>> streamMyBusiness(String uid) {
    return businessCollection.where('deviceID', isEqualTo: uid).snapshots().map(
        (event) =>
            event.docs.map((e) => BusinessModel.fromJson(e.data())).toList());
  }

  ///Delete Business
  Future<void> deleteBusiness(BuildContext context, String docID) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    await businessCollection.doc(docID).delete();
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsFree);
  }

  ///Get Specific Business
  Stream<BusinessModel> streamSpecificBusiness(String docID) {
    return businessCollection
        .doc(docID)
        .snapshots()
        .map((event) => BusinessModel.fromJson(event.data()!));
  }
}
