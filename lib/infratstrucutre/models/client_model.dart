// To parse this JSON data, do
//
//     final clientModel = clientModelFromJson(jsonString);

import 'dart:convert';

ClientModel clientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson(
    docID: data.docId.toString(), deviceID: data.deviceID.toString()));

class ClientModel {
  ClientModel({
    this.name,
    this.email,
    this.number,
    this.fax,
    this.address,
    this.docId,
    this.deviceID,
  });

  String? name;
  String? email;
  String? number;
  String? fax;
  String? address;
  String? docId;
  String? deviceID;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        fax: json["fax"],
        address: json["address"],
        docId: json["docID"],
        deviceID: json["deviceID"],
      );

  Map<String, dynamic> toJson(
          {required String docID, required String deviceID}) =>
      {
        "name": name,
        "email": email,
        "number": number,
        "fax": fax,
        "address": address,
        "docID": docID,
        "deviceID": deviceID,
      };
}
