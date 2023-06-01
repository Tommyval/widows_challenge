class WidowsCount {
  final int count;

  WidowsCount({required this.count});

  factory WidowsCount.fromJson(Map<String, dynamic> json) {
    return WidowsCount(
      count: json['count'] ,
    );
  }
  //   static List<WidowsCount> widowsFromSnapShot(List widowsCount) {
  //   return widowsCount.map((json) {
  //     return WidowsCount.fromJson(json);
  //   }).toList();
  // }
}
