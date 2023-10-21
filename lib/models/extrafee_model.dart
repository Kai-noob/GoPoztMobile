class ExtraFeeModel {
  final String name;
  final double deliveryFee;
  final double urgentFee;
  final double overWeightFee;

  ExtraFeeModel({
    required this.name,
    required this.deliveryFee,
    required this.urgentFee,
    required this.overWeightFee,
  });

  factory ExtraFeeModel.fromJson(Map<String, dynamic> json) {
    return ExtraFeeModel(
      name: json['name'],
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      urgentFee: (json['urgent_fee'] as num).toDouble(),
      overWeightFee: (json['over_weight_fee'] as num).toDouble(),
    );
  }
}
