class AnnouncementModel {
  List<Announcement> announcements;

  AnnouncementModel({
    required this.announcements,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    final announcementsList = json['announcements'] as List;
    List<Announcement> announcements =
        announcementsList.map((announcementJson) {
      return Announcement.fromJson(announcementJson);
    }).toList();

    return AnnouncementModel(announcements: announcements);
  }
}

class Announcement {
  String title;
  String? image;
  String description;

  Announcement({
    required this.title,
    this.image,
    required this.description,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      title: json['title'],
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
