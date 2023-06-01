import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/core/enums/drawer_enum.dart';
import 'package:widows_challenge/ui/widgets/drawer/drawe_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerModel>.reactive(
      viewModelBuilder: () => DrawerModel(),
      builder: (context, viewModel, child) {
        return Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: viewModel.selectHomeOption,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 2,
                    decoration: BoxDecoration(
                        color: viewModel.selectedOption == DrawersEnum.home
                            ? Colors.purple
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text('Home'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: viewModel.selectDataOption,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 2,
                    decoration: BoxDecoration(
                        color:
                            viewModel.selectedOption == DrawersEnum.widowsData
                                ? Colors.purple
                                : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text('Widows Data'),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
