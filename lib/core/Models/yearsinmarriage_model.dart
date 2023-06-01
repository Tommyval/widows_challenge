class YearsInMarriageData {
  final String title;
  final int value;
  final int ordinal;

  YearsInMarriageData({
    required this.title,
    required this.value,
    required this.ordinal,
  });

  factory YearsInMarriageData.fromJson(Map<String, dynamic> json) {
    return YearsInMarriageData(
      title: json['title'],
      value: json['value'],
      ordinal: json['ordinal'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["title"] = title;
    data['value'] = value;
    data['ordinal'] = ordinal;
    return data;
  }
}
