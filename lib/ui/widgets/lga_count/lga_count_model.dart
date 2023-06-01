import 'package:stacked/stacked.dart';
import 'package:widows_challenge/core/Models/lga_count_model.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/services/api/widowsdata_service.dart';

class LgaCountViewModel extends BaseViewModel {
  WidowsDataService widowsDataService = locator<WidowsDataService>();

  LgaCountModel? _lgaCount = LgaCountModel(lgaCount: 0);
  LgaCountModel? get lgaCount => _lgaCount;
  Future<void> LoadLgaCount() async {
    try {
      _lgaCount = await widowsDataService.fetchLgaCount();
      // print(_widowsCount!.count);
      notifyListeners();
    } catch (error) {
      print('Error fetching widows count: $error');
    }
  }
}
