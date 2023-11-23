class ExtraFeeModel {
  final String name;

  final dynamic urgentFee;
  final dynamic overWeightFee;

  ExtraFeeModel({
    required this.name,

    required this.urgentFee,
    required this.overWeightFee,
  });

  factory ExtraFeeModel.fromJson(Map<String, dynamic> json) {
    return ExtraFeeModel(
      name: json['name'],

      urgentFee: (json['urgent_fee'] as num).toDouble(),
      overWeightFee: (json['over_weight_fee'] as num).toDouble(),
    );
  }
}
