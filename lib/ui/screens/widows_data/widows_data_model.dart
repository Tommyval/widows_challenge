import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app_setup.locator.dart';
import '../../../core/Models/widows_Data/widows_card_model.dart';
import '../../../core/enums/dialog_enum.dart';
import '../../../core/services/api/widowsdata_service.dart';

class WidowsDataModel extends BaseViewModel {
  TextEditingController pageController = TextEditingController();
  NavigationService navigationService = locator<NavigationService>();
  WidowsDataService widowsDataService = locator<WidowsDataService>();
  var goToPageDialogService = locator<DialogService>();
  List<WidowsCard> _widowsCards = [];
  WidowsCard? selectedWidow;

  List<WidowsCard> get widowsCard => _widowsCards;
  NavigationService navigator = locator<NavigationService>();
  int currentPage = 1;
  int pageSize = 18;
  int totalWidows = 0;
  int totalPages = 0;
  bool hasMorePages = true;
  bool get canLoadPreviousPage => currentPage > 0;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get canLoadNextPage => hasMorePages;
  Future<void> fetchCardData() async {
    _isLoading = true;
    final response = await widowsDataService.fetchLgaCount();
    totalWidows = response.lgaCount;
    totalPages = (totalWidows / pageSize).ceil();
    _widowsCards = await widowsDataService.fetchData(currentPage);
    _isLoading = false;
    //log(_widowsCards.last.fullName.toString());
    //backdropfilter
  }

  Future showGoToPageDialog() async {
    var response = await goToPageDialogService.showCustomDialog(
      variant: DialogType.goToPage,
    );
    if (response?.confirmed == true) {
      final pageNumber = int.tryParse(pageController.text.trim());
      if (pageNumber != null) {
        goToPage(pageNumber);
        navigationService.back();
      }
    }
  }

  void previousPage() {
    if (canLoadPreviousPage) {
      currentPage--;
      widowsDataService.fetchData(currentPage);
      notifyListeners();
    }
  }

  void goToPage(int page) {
    currentPage = page;
    widowsDataService.fetchData(currentPage);
    notifyListeners();
  }

  // Function to go to the next page
  void nextPage() {
    if (canLoadNextPage) {
      currentPage++;
      widowsDataService.fetchData(currentPage);
      notifyListeners();
    }
  }
}
