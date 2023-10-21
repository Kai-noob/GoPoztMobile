class CategoryModel {
  final int id;
  final String name;
  final int isAvaliable;

  CategoryModel({
    required this.id,
    required this.name,
    required this.isAvaliable
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      isAvaliable:json['isAvailable']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isAvailable':isAvaliable
    };
  }
}
