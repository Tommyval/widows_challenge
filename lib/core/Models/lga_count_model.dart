class LgaCountModel {
  final int lgaCount;

  LgaCountModel({required this.lgaCount});

  factory LgaCountModel.fromJson(Map<String, dynamic> json) {
    return LgaCountModel(
      lgaCount: json['data']['lga_count'] ?? 0,
    );
  }
}
