class ChildrenData {
  ChildrenData({
    required this.title,
    required this.value,
    required this.ordinal,
  });
  String title;
  int value;
  int ordinal;

  factory ChildrenData.fromJson(Map<String, dynamic> json) => ChildrenData(
        title: json["title"],
        value: json["value"],
        ordinal: json["ordinal"],
      );
}
