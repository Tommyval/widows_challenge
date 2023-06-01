import 'package:stacked/stacked.dart';


import '../../../../../core/Models/ngomembership_model.dart';
import '../../../../../app/app_setup.locator.dart';
import '../../../../../core/services/api/widowsdata_service.dart';

class NGOStatusModel extends BaseViewModel {
 WidowsDataService widowsDataService =
      locator<WidowsDataService>();
  List<NGOAffiliation> _nGOStatusData = [];
  get nGoStatusData => _nGOStatusData;
  Future<void> nGOStatus() async {
    try {
      _nGOStatusData = await widowsDataService.ngoMembership();
      notifyListeners();
    } catch (error) {
      print('Error fetching employment status data: $error');
    }
  }
}
