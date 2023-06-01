import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widows_challenge/app/app_setup.locator.dart';

import '../../../core/enums/tabView_enums.dart';

class PersonalDetailsModel extends BaseViewModel {
  NavigationService navigator = locator<NavigationService>();
  var _myTabView = MyTabview.personsal;
  get myTabView => _myTabView;

  void tabFunctionPersonal() {
    if (_myTabView == MyTabview.personsal) {
      return;
    }
    _myTabView = MyTabview.personsal;

    notifyListeners();
  }

  void navigateBack() {
    navigator.back();
  }

  void tabFunctionBankDetails() {
    if (_myTabView == MyTabview.bank) {
      return;
    }
    _myTabView = MyTabview.bank;

    notifyListeners();
  }
}
