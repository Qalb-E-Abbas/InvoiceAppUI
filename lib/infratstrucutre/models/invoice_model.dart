// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

import 'package:invoiceapp/infratstrucutre/models/business_model.dart';
import 'package:invoiceapp/infratstrucutre/models/client_model.dart';

InvoiceModel invoiceModelFromJson(String str) =>
    InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson(
    docID: data.docID.toString(), deviceID: data.deviceID.toString()));

class InvoiceModel {
  InvoiceModel({
    this.business,
    this.invoiceId,
    this.totalCost,
    this.date,
    this.dueDate,
    this.description,
    this.clientModel,
    this.status,
    this.addItem,
    this.discountPrice,
    this.tax,
    this.bankDetails,
    this.docID,
    this.monthID,
    this.deviceID,
  });

  BusinessModel? business;
  String? invoiceId;
  String? docID;
  String? deviceID;
  String? monthID;

  String? totalCost;
  String? date;
  String? dueDate;
  String? description;
  String? status;
  ClientModel? clientModel;
  List<AddItem>? addItem;
  DiscountPrice? discountPrice;
  Tax? tax;
  BankDetails? bankDetails;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        business: BusinessModel.fromJson(json["business"]),
        invoiceId: json["invoiceID"],
        totalCost: json["totalCost"],
        docID: json["docID"],
        date: json["date"],
        dueDate: json["dueDate"],
        deviceID: json["deviceID"],
        monthID: json["monthID"],
        description: json["description"],
        clientModel: ClientModel.fromJson(json["clientModel"]),
        status: json["status"],
        addItem:
            List<AddItem>.from(json["addItem"].map((x) => AddItem.fromJson(x))),
        discountPrice: DiscountPrice.fromJson(json["discountPrice"]),
        tax: Tax.fromJson(json["tax"]),
        bankDetails: BankDetails.fromJson(json["bankDetails"]),
      );

  Map<String, dynamic> toJson(
          {required String docID, required String deviceID}) =>
      {
        "business": business!.toJson(docID: docID),
        "invoiceID": invoiceId,
        "totalCost": totalCost,
        "docID": docID,
        "monthID": monthID,
        "date": date,
        "dueDate": dueDate,
        "deviceID": deviceID,
        "description": description,
        "clientModel": clientModel!.toJson(
            deviceID: clientModel!.deviceID.toString(),
            docID: clientModel!.docId.toString()),
        "status": status,
        "addItem": List<dynamic>.from(addItem!.map((x) => x.toJson())),
        "discountPrice": discountPrice!.toJson(),
        "tax": tax!.toJson(),
        "bankDetails": bankDetails!.toJson(),
      };
}

class AddItem {
  AddItem({
    this.name,
    this.cost,
    this.quantity,
  });

  String? name;
  String? cost;
  String? quantity;

  factory AddItem.fromJson(Map<String, dynamic> json) => AddItem(
        name: json["name"],
        cost: json["cost"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cost": cost,
        "quantity": quantity,
      };
}

class BankDetails {
  BankDetails({
    this.other,
  });

  String? other;

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        other: json["other"],
      );

  Map<String, dynamic> toJson() => {
        "other": other,
      };
}

class Business {
  Business({
    this.businessName,
    this.logo,
    this.ownerName,
  });

  String? businessName;
  String? logo;
  String? ownerName;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        businessName: json["businessName"],
        logo: json["logo"],
        ownerName: json["ownerName"],
      );

  Map<String, dynamic> toJson() => {
        "businessName": businessName,
        "logo": logo,
        "ownerName": ownerName,
      };
}

class DiscountPrice {
  DiscountPrice({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory DiscountPrice.fromJson(Map<String, dynamic> json) => DiscountPrice(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class Invoice {
  Invoice({
    this.name,
    this.phoneNumber,
    this.email,
    this.website,
  });

  String? name;
  String? phoneNumber;
  String? email;
  String? website;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "website": website,
      };
}

class Tax {
  Tax({
    this.name,
    this.number,
    this.rate,
  });

  String? name;
  String? number;
  String? rate;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        name: json["name"],
        number: json["number"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "rate": rate,
      };
}
