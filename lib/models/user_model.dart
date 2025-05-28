class UsersModel {
  final String id;
  final String image;
  final String name;

  UsersModel({required this.image, required this.name, required this.id});

  factory UsersModel.fromJson(Map<String, dynamic> json, String id) {
    return UsersModel(image: json["image"], name: json["name"], id: id);
  }

  Map<String, dynamic> toJson() {
    return {"image": image, "name": name, "id": id};
  }
}
