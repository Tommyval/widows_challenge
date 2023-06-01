class NGOAffiliation {
  NGOAffiliation({
    required this.title,
    required this.value,
  });
  String title;
  int value;

  factory NGOAffiliation.fromJson(Map<String, dynamic> json) => NGOAffiliation(
        title: json["title"],
        value: json["value"],
      );
  static List<NGOAffiliation> ngoFromSnapShot(List ngoAffliation) {
    return ngoAffliation.map((json) {
      return NGOAffiliation.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["title"] = title;
    data['value'] = value;
    return data;
  }
}
