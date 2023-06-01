import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:widows_challenge/ui/screens/mainpage.dart';
import 'package:widows_challenge/ui/screens/personal/personal_details_view.dart';
import 'package:widows_challenge/ui/screens/widows_data/widows_data_view.dart';

import '../core/services/api/widowsdata_service.dart';





@StackedApp(routes: [
  MaterialRoute(page: MainPage, initial: true),
  MaterialRoute(page: WidowsDataView),
 //MaterialRoute(page: PersonalDetailsScreen),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType:  WidowsDataService),
])
class AppSetup {}
