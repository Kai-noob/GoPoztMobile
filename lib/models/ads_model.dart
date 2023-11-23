class Advertisement {
  String name;
  String image;
  String description;

  Advertisement({
    required this.name,
    required this.image,
    required this.description,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      name: json['name'],
      image: json['image'],
      description: json['description'],
    );
  }
}
