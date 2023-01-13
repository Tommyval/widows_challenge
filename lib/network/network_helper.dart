import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:widows_challenge/Models/widow_model.dart';

class NetworkHelper {
  Future<List<ChartModel>> getAssetsFromLocalJson() async {
    final data =
        await rootBundle.loadString('asset/json/Forged Widows Data.json');

    final response = jsonDecode(data) as List<dynamic>;
    // log(
    //   response[0].toString(),
    // );
    // print(response.length);
    return response.map((e) => ChartModel.fromJson(e)).toList();
  }
}

// import 'package:http/http.dart' as http;

// class NetworkHelper {
//   Future<http.Response> get(String endpoint) async {
//     var url = Uri.parse(endpoint);
//     var response = await http.get(url);

//     return response;
//   }
// }
