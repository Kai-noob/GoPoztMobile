class OnlineShop {
  int customerId;
  String name;
  String? logo;
  String type;
  String phone;
  String description;
  String? facebookLink;

  OnlineShop({
    required this.customerId,
    required this.name,
    this.logo,
    required this.type,
    required this.phone,
    required this.description,
    this.facebookLink,
  });

  factory OnlineShop.fromJson(Map<String, dynamic> json) {
    return OnlineShop(
      customerId: json['customer_id'],
      name: json['name'],
      logo: json['logo'],
      type: json['type'],
      phone: json['phone'],
      description: json['description'],
      facebookLink: json['facebook_link'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['name'] = name;
    data['logo'] = logo;
    data['type'] = type;
    data['phone'] = phone;
    data['description'] = description;
    data['facebook_link'] = facebookLink;
    return data;
  }
}

class OnlineShopModel {
  List<OnlineShop> onlineShops;

  OnlineShopModel({
    required this.onlineShops,
  });

  factory OnlineShopModel.fromJson(Map<String, dynamic> json) {
    final onlineShopsList = json['onlineShops'] as List;
    List<OnlineShop> onlineShops = onlineShopsList.map((onlineShopJson) {
      return OnlineShop.fromJson(onlineShopJson);
    }).toList();

    return OnlineShopModel(onlineShops: onlineShops);
  }
}
