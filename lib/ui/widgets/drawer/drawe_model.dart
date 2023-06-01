import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widows_challenge/core/enums/drawer_enum.dart';

import '../../../app/app_setup.locator.dart';
import '../../../app/app_setup.router.dart';

class DrawerModel extends BaseViewModel {
  NavigationService navigator = locator<NavigationService>();
  DrawersEnum _selectedOption = DrawersEnum.home;
  get selectedOption => _selectedOption;

  void selectHomeOption() {
    if (_selectedOption == DrawersEnum.home) {
      return;
    }
    _selectedOption = DrawersEnum.home;
    notifyListeners();
  }

  void selectDataOption() {
    if (_selectedOption == DrawersEnum.widowsData) {
      return;
    }
    _selectedOption = DrawersEnum.widowsData;
    notifyListeners();

    navigator.navigateTo(Routes.widowsDataView);
  }
}
