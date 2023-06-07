import 'package:stacked_services/stacked_services.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/enums/dialog_enum.dart';
import '../../dialog/go_to_page.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();
  final builders = {
    DialogType.goToPage: (context, sheetRequest, completer) =>
        GoToCustomDialog(request: sheetRequest, completer: completer),
   
  };
  dialogService.registerCustomDialogBuilders(builders);
}
