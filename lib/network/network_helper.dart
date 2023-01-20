import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class NetworkHelper {
  Map<String, dynamic> lga = {};
  Map<String, dynamic> empment = {};
  Map<String, dynamic> occupy = {};
  Map<String, dynamic> affliation = {};

  List<dynamic> response = [];
  Future<void> getAssetsFromLocalJson() async {
    final data =
        await rootBundle.loadString('asset/json/Forged Widows Data.json');

    response = jsonDecode(data) as List<dynamic>;

    // log(
    //   response[0].toString(),
    // );
    // print(response.length);
    //return response.map((e) => ChartModel.fromJson(e)).toList();
    iteratedData();
  }

  void iteratedData() {
    for (var item in response) {
      String myKey = item['lga'];
      if (lga.containsKey(myKey)) {
        lga[myKey] = lga[myKey] + 1; //iteration through the whole json file
      } else {
        lga[myKey] = 1; //give back the whole data collected
      }
      String myKey2 = item['employmentStatus'];
      if (empment.containsKey(myKey2)) {
        empment[myKey2] = empment[myKey2] + 1;
      } else {
        empment[myKey2] = 1;
      }
      String myKey3 = item['husbandOccupation'];
      if (occupy.containsKey(myKey3)) {
        occupy[myKey3] = occupy[myKey3] + 1;
      } else {
        occupy[myKey3] = 1;
      }
      String myKey4 = item['ngoMembership'];
      if (affliation.containsKey(myKey4)) {
        affliation[myKey4] = affliation[myKey4] + 1;
      } else {
        affliation[myKey4] = 1;
      }
    }
    // print('ngoMembership: $affliation');
  }
}
