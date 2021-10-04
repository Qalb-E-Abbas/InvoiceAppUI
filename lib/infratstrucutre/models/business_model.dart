// To parse this JSON data, do
//
//     final businessModel = businessModelFromJson(jsonString);

import 'dart:convert';

BusinessModel businessModelFromJson(String str) =>
    BusinessModel.fromJson(json.decode(str));

String businessModelToJson(BusinessModel data) =>
    json.encode(data.toJson(docID: data.docID.toString()));

class BusinessModel {
  BusinessModel({
    this.logo,
    this.name,
    this.ownerName,
    this.number,
    this.address,
    this.email,
    this.website,
    this.docID,
  });

  String? logo;
  String? name;
  String? ownerName;
  String? number;
  String? address;
  String? email;
  String? website;
  String? docID;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        logo: json["logo"],
        name: json["name"],
        ownerName: json["ownerName"],
        number: json["number"],
        address: json["address"],
        email: json["email"],
        website: json["website"],
        docID: json["docID"],
      );

  Map<String, dynamic> toJson({required String docID}) => {
        "logo": logo,
        "name": name,
        "ownerName": ownerName,
        "number": number,
        "address": address,
        "email": email,
        "website": website,
        "docID": docID,
      };
}
