class EmploymentStatusData {
  EmploymentStatusData({
    required this.title,
    required this.value,
  });
  String title;
  int value;

  factory EmploymentStatusData.fromJson(Map<String, dynamic> json) =>
      EmploymentStatusData(
        title: json["title"],
        value: json["value"],
      );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["title"] = title;
    data['value'] = value;
    return data;
  }
}
