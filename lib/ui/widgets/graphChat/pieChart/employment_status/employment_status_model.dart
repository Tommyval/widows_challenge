import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widows_challenge/app/app_setup.locator.dart';


import '../../../../../core/Models/employment_model.dart';
import '../../../../../core/services/api/widowsdata_service.dart';

class EmploymentStatusModel extends BaseViewModel {
  WidowsDataService widowsDataService =
      locator<WidowsDataService>();
  List<EmploymentStatusData> _employmentStatusData = [];
  get employmentStatusData => _employmentStatusData;
  Future<void> employmentStatus() async {
    try {
      _employmentStatusData = await widowsDataService.emplymentStatus();
      notifyListeners();
    } catch (error) {
      print('Error fetching employment status data: $error');
    }
  }
}
