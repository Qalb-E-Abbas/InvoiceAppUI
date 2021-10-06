class InvoiceCounter {
  InvoiceCounter({
    this.docID,
    this.userID,
  });

  String? docID;
  String? userID;

  factory InvoiceCounter.fromJson(Map<String, dynamic> json) => InvoiceCounter(
        docID: json["docID"],
        userID: json["userID"],
      );

  Map<String, dynamic> toJson(
          {required String userID, required String docID}) =>
      {
        "docID": docID,
        "userID": userID,
      };
}
