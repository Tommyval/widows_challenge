import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widows_challenge/ui/screens/widows_data/widows_data_model.dart';

class GoToCustomDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const GoToCustomDialog(
      {super.key, required this.request, required this.completer});
  @override
  Widget build(BuildContext context) {
    WidowsDataModel widowsDataModel = WidowsDataModel();
    return AlertDialog(
      title: const Text('Go to Page'),
      content: TextField(
        controller: widowsDataModel.pageController,
        decoration: const InputDecoration(labelText: 'Page Number'),
        keyboardType: TextInputType.number,
      ),
      actions: [
        TextButton(
          onPressed: () {
            completer(DialogResponse(confirmed: true));
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final pageNumber =
                int.tryParse(widowsDataModel.pageController.text.trim());
            if (pageNumber != null) {
              widowsDataModel.goToPage(pageNumber);
              Navigator.pop(context);
            }
            completer(DialogResponse(confirmed: true));
          },
          child: const Text('Go'),
        ),
      ],
    );
  }
}
