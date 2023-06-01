
class LocalGovtData {
 LocalGovtData({
required this.title,
required this.value,
});
String title;
int value;

  factory LocalGovtData.fromJson(Map<String, dynamic> json) =>
      LocalGovtData(
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
