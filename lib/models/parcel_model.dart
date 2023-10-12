class ParcelModel {
  final String deliveryTime;

  final String itemType;
  final bool isPrepaid;
  final String parcelSize;
  final int weight;
  final int cashAmount;

  ParcelModel(
      {required this.deliveryTime,
      required this.itemType,
      required this.isPrepaid,
      required this.parcelSize,
      required this.weight,
      required this.cashAmount});
  Map<String, dynamic> toJson() {
    return {
      "deliveryTime": deliveryTime,
      "itemType": itemType,
      "isPrepaid": isPrepaid,
      "parcelSize": parcelSize,
      "weight": weight,
      "cashAmount": cashAmount
    };
  }

  factory ParcelModel.fromJson(Map<String, dynamic> json) {
    return ParcelModel(
      deliveryTime: json['deliveryTime'],
      itemType: json['itemType'],
      isPrepaid: json['isPrepaid'],
      parcelSize: json['parcelSize'],
      weight: json['weight'],
      cashAmount: json['cashAmount'],
    );
  }
}
