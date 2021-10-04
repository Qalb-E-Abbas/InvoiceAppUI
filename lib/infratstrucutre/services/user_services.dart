import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoiceapp/application/app_state.dart';
import 'package:invoiceapp/infratstrucutre/models/business_model.dart';
import 'package:provider/provider.dart';

class UserServices {
  ///Instantiate LocalDB
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  BusinessModel _businessModel = BusinessModel();

  BusinessModel get doctorModel => _businessModel;

  ///Collection Reference of Users
  final CollectionReference<Map<String, dynamic>> _ref =
      FirebaseFirestore.instance.collection('invoiceAppUsers');

  ///Add User data to Cloud Firestore
  Future<void> addUserData(
      User user, BusinessModel businessModel, BuildContext context) {
    return _ref.doc(user.uid).set(businessModel.toJson(docID: user.uid));
  }

  ///Stream a LoggedIn User
  Stream<BusinessModel> streamUserData(String docID) {
    return _ref
        .doc(docID)
        .snapshots()
        .map((snap) => BusinessModel.fromJson(snap.data()!));
  }

  ///Update User Data
  Future<void> updateUserData(BuildContext context,
      {required BusinessModel model}) async {
    return await _ref.doc(model.docID).update({
      "logo": model.logo,
      "name": model.name,
      "ownerName": model.ownerName,
      "number": model.number,
      "address": model.address,
      "website": model.website,
    });
  }

  ///Upload User Profile Pic
  Future uploadFile(BuildContext context,
      {required File image, required BusinessModel userModel}) async {
    try {
      Provider.of<AppState>(context, listen: false)
          .stateStatus(StateStatus.IsBusy);
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('invoiceApp/${image.path.split('/').last}');
      UploadTask uploadTask = storageReference.putFile(image);
      return uploadTask.whenComplete(() async {
        Provider.of<AppState>(context, listen: false)
            .stateStatus(StateStatus.IsFree);
      });
    } catch (e) {
      Provider.of<AppState>(context, listen: false)
          .stateStatus(StateStatus.IsError);
    }
  }
}
