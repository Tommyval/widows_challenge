import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/app/app_setup.locator.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../../../../../core/Models/yearsinmarriage_model.dart';
import '../../../../../core/services/api/widowsdata_service.dart';


class YearsInMarriageStatusModel extends BaseViewModel {
  WidowsDataService widowsDataService =
      locator<WidowsDataService>();
  List<YearsInMarriageData> _yearsInMarriageData = [];
  get yearsInMarriageStatusData => _yearsInMarriageData;
  Future<void> yearsInmarriageStatus() async {
    try {
      _yearsInMarriageData = await widowsDataService.yearsInMarriageData();
      notifyListeners();
    } catch (error) {
      print('Error fetching employment status data: $error');
    }
  }

  List<charts.Series<YearsInMarriageData, String>> createSampleData() {
    return [
      charts.Series<YearsInMarriageData, String>(
          data: yearsInMarriageStatusData,
          id: 'Years In Marriage',
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(const Color(0xff039CDD)),
          domainFn: (YearsInMarriageData marriageModel, _) =>
              marriageModel.title,
          measureFn: (YearsInMarriageData marriageModel, _) =>
              marriageModel.value)
    ];
  }
}
