import 'dart:convert';
import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:widows_challenge/core/Models/lga_count_model.dart';
import 'package:widows_challenge/core/Models/lga_model.dart';
import 'package:widows_challenge/core/Models/widows_Data/widows_card_model.dart';

import '../../Models/employment_model.dart';
import '../../Models/ngomembership_model.dart';
import '../../Models/occupation_model.dart';
import '../../Models/widows_count_model.dart';
import '../../Models/yearsinmarriage_model.dart';

class WidowsDataService with ListenableServiceMixin {
  Future<List<EmploymentStatusData>> emplymentStatus() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);
      //log('Response body: ${response.body}');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> employmentData =
          jsonData['data']['EmploymentStatusData']['data'];
      List<EmploymentStatusData> parsedData = employmentData
          .map((item) => EmploymentStatusData.fromJson(item))
          .toList();
      //log(parsedData.length.toString());
      return parsedData;
    } catch (error) {
      print('Error fetching employment status data: $error');
      return [];
    }
  }

  Future<List<OccupationData>> occupationData() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);
      //log('Response body: ${response.body}');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> occupationData = jsonData['data']['OccupationData']['data'];
      List<OccupationData> parsedData =
          occupationData.map((item) => OccupationData.fromJson(item)).toList();
      //log(parsedData.first.value.toString());
      return parsedData;
    } catch (error) {
      print('Error fetching employment status data: $error');
      return [];
    }
  }

  Future<List<LocalGovtData>> localGovtStatus() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);
      //log('Response body: ${response.body}');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> localGovtData = jsonData['data']['LocalGovData']['data'];
      List<LocalGovtData> parsedData =
          localGovtData.map((item) => LocalGovtData.fromJson(item)).toList();
      //log(parsedData.length.toString());
      return parsedData;
    } catch (error) {
      print('Error fetching employment status data: $error');
      return [];
    }
  }

  Future<List<NGOAffiliation>> ngoMembership() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);
      //log('Response body: ${response.body}');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> NGOData = jsonData['data']['NGOAffiliation']['data'];
      List<NGOAffiliation> parsedData =
          NGOData.map((item) => NGOAffiliation.fromJson(item)).toList();
      //log(parsedData.first.value.toString());
      return parsedData;
    } catch (error) {
      print('Error fetching employment status data: $error');
      return [];
    }
  }

  Future<List<YearsInMarriageData>> yearsInMarriageData() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);
      //log('Response body: ${response.body}');
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> yearsData = jsonData['data']['YearsInMarriageData']['data'];
      List<YearsInMarriageData> parsedData =
          yearsData.map((item) => YearsInMarriageData.fromJson(item)).toList();
      return parsedData;
    } catch (error) {
      print('Error fetching employment status data: $error');
      return [];
    }
  }

  Future<WidowsCount> fetchWidowsCount() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Map<String, dynamic> widowsCountData = jsonData['data']['widows_count'];
      WidowsCount widowsCount = WidowsCount.fromJson(widowsCountData);
      //log(widowsCount.count.toString());
      return widowsCount;
    } catch (error) {
      print('Error fetching widows count: $error');
      throw Exception('Failed to fetch widows count');
    }
  }

  Future<LgaCountModel> fetchLgaCount() async {
    try {
      var url = Uri.parse(
          'https://us-central1-ondo-widows-f2964.cloudfunctions.net/homepageData');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var homePageData = LgaCountModel.fromJson(jsonData);
        //log(homePageData.lgaCount.toString());
        return homePageData;
      } else {
        throw Exception('Failed to fetch home page data');
      }
    } catch (error) {
      print('Error fetching home page data: $error');
      rethrow;
    }
  }

  Future<List<WidowsCard>> fetchData() async {
    var url = Uri.parse(
        'https://us-central1-ondo-widows-f2964.cloudfunctions.net/allWidows');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);

      if (jsonData['data'] != null) {
        List<dynamic> widowsData = jsonData['data'];
        List<WidowsCard> widowsCards = widowsData
            .map((widowData) => WidowsCard.fromMap(widowData))
            .toList();
        //log(widowsCards.last.fullName!);
        return widowsCards;
      }
    } else {
      throw Exception(
          'Failed to fetch widows data. Error: ${response.statusCode}');
    }

    return [];
  }
}
