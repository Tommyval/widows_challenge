import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widows_challenge/app/app_setup.locator.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

import '../../../../../core/Models/lga_model.dart';
import '../../../../../core/services/api/widowsdata_service.dart';


class LocalGovtStatusModel extends BaseViewModel {
 WidowsDataService widowsDataService =
      locator<WidowsDataService>();
  List<LocalGovtData> _localGovtStatusData = [];
  get localGovtStatusData => _localGovtStatusData;
  Future<void> localGovtStatus() async {
    try {
      _localGovtStatusData = await widowsDataService.localGovtStatus();
      notifyListeners();
    } catch (error) {
      print('Error fetching employment status data: $error');
    }
  }
  List<charts.Series<LocalGovtData, String>> createSampleData() {
    return [
      charts.Series<LocalGovtData, String>(
          data: localGovtStatusData,
          id: 'lga',
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(const Color(0xff602BF8)),
          domainFn: (LocalGovtData lgamodel, _) => lgamodel.title,
          measureFn: (LocalGovtData lgamodel, _) => lgamodel.value)
    ];
  }

}
