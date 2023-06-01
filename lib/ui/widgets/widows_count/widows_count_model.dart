import 'package:stacked/stacked.dart';

import '../../../core/Models/widows_count_model.dart';
import '../../../app/app_setup.locator.dart';
import '../../../core/services/api/widowsdata_service.dart';

class WidowsCountModel extends BaseViewModel {
  WidowsDataService widowsDataService = locator<WidowsDataService>();

  WidowsCount? _widowsCount = WidowsCount(count: 0);
  WidowsCount? get widowsCount => _widowsCount;

  Future<void> fetchWidowsCount() async {
    try {
      _widowsCount = await widowsDataService.fetchWidowsCount();
      // print(_widowsCount!.count);
      notifyListeners();
    } catch (error) {
      print('Error fetching widows count: $error');
    }
  }
}
