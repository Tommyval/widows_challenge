import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app_setup.locator.dart';
import '../../../app/app_setup.router.dart';
import '../../../core/Models/widows_Data/widows_card_model.dart';
import '../../../core/services/api/widowsdata_service.dart';

class WidowsDataModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  WidowsDataService widowsDataService = locator<WidowsDataService>();
  List<WidowsCard> _widowsCards = [];
  WidowsCard? selectedWidow;

  List<WidowsCard> get widowsCard => _widowsCards;
  NavigationService navigator = locator<NavigationService>();
  final int _numberOfPages = 10;
  int _currentPage = 0;

  int get numberOfPages => _numberOfPages;
  int get currentPage => _currentPage;
  void changePageIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<void> fetchCardData() async {
    _widowsCards = await widowsDataService.fetchData();
    log('my ngoMembership: ${_widowsCards.first.ngoName}');
  }

  void navigateToPersonalScreen() {
    navigationService.navigateTo(Routes.personalDetailsScreen);
  }
}
