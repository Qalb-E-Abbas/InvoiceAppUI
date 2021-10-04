import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/infratstrucutre/models/invoice_model.dart';
import 'package:provider/provider.dart';

class InvoiceServices {
  CollectionReference<Map<String, dynamic>> invoiceCollection =
      FirebaseFirestore.instance.collection('invoiceData');

  ///Create Invoice
  Future<void> createInvoice(BuildContext context,
      {required InvoiceModel model, required String deviceID}) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('invoiceData').doc();
    return await docRef
        .set(model.toJson(docID: docRef.id, deviceID: deviceID))
        .then((value) => Provider.of<AppState>(context, listen: false)
            .stateStatus(StateStatus.IsFree));
  }

  ///Get Invoice
  Stream<List<InvoiceModel>> streamMyInvoice(String uid) {
    return invoiceCollection.where('deviceID', isEqualTo: uid).snapshots().map(
        (event) =>
            event.docs.map((e) => InvoiceModel.fromJson(e.data())).toList());
  }

  ///Get Invoice
  Stream<List<InvoiceModel>> streamClientInvoice(String clientID) {
    print("Client ID : $clientID");
    return invoiceCollection
        .where('clientModel.docID', isEqualTo: clientID)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => InvoiceModel.fromJson(e.data())).toList());
  }

  ///Get Monthly Invoice
  Stream<List<InvoiceModel>> streamMonthlyInvoice(String monthID) {
    return invoiceCollection
        .where('monthID', isEqualTo: monthID)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => InvoiceModel.fromJson(e.data())).toList());
  }

  ///Get Paid Invoices
  Stream<List<InvoiceModel>> streamPaidInvoices(String uid) {
    return invoiceCollection
        .where('deviceID', isEqualTo: uid)
        .where('status', isEqualTo: "PAID")
        .snapshots()
        .map((event) =>
            event.docs.map((e) => InvoiceModel.fromJson(e.data())).toList());
  }

  ///Get UnPaid Invoices
  Stream<List<InvoiceModel>> streamOutstandingInvoices(String uid) {
    return invoiceCollection
        .where('deviceID', isEqualTo: uid)
        .where('status', isEqualTo: "UNPAID")
        .snapshots()
        .map((event) =>
            event.docs.map((e) => InvoiceModel.fromJson(e.data())).toList());
  }

  ///Update Invoice
  Future<void> updateInvoice(BuildContext context, String docID) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    return await invoiceCollection.doc(docID).update({'status': "PAID"}).then(
        (value) => Provider.of<AppState>(context, listen: false)
            .stateStatus(StateStatus.IsFree));
  }

  ///Delete Invoice
  Future<void> deleteInvoice(BuildContext context, String docID) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    await invoiceCollection.doc(docID).delete();
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsFree);
  }
}
