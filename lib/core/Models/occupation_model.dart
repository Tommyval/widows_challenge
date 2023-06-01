class WorkType {
  final String works;
  final int workNo;

  WorkType({required this.works, required this.workNo});
}

class OccupationData {
  OccupationData({
    required this.title,
    required this.value,
  });
  String title;
  int value;

  factory OccupationData.fromJson(Map<String, dynamic> json) => OccupationData(
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
