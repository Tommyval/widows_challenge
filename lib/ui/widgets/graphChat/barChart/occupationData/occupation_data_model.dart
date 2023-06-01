import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widows_challenge/core/Models/occupation_model.dart';
import 'package:widows_challenge/app/app_setup.locator.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../../../../../core/Models/employment_model.dart';
import '../../../../../core/Models/lga_model.dart';
import '../../../../../core/services/api/widowsdata_service.dart';


class OccupationStatusModel extends BaseViewModel {
WidowsDataService widowsDataService =
      locator<WidowsDataService>();
  List<OccupationData> _occupationStatusData = [];
  get occupationStatusData => _occupationStatusData;
  Future<void> occupationStatus() async {
    try {
      _occupationStatusData = await widowsDataService.occupationData();
      notifyListeners();
    } catch (error) {
      print('Error fetching employment status data: $error');
    }
  }

  List<charts.Series<OccupationData, String>> createSampleData() {
    return [
      charts.Series<OccupationData, String>(
          data: occupationStatusData,
          id: 'occupation',
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(const  Color(0xff039CDD)),
          domainFn: (OccupationData occupationModel, _) => occupationModel.title,
          measureFn: (OccupationData occupationModel, _) => occupationModel.value)
    ];
  }
}
