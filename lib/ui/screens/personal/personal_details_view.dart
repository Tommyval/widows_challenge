import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/ui/screens/personal/personal_details_model.dart';
import 'package:widows_challenge/ui/widgets/bank_details_widget.dart';

import '../../../core/enums/tabView_enums.dart';
import '../../widgets/personal_details_widget.dart';
import '../widows_data/widows_data_model.dart';

class PersonalDetailsScreen extends StatelessWidget {
  WidowsDataModel widowsDataModel;
  PersonalDetailsScreen({super.key, required this.widowsDataModel});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalDetailsModel>.reactive(
      viewModelBuilder: () => PersonalDetailsModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      viewModel.navigateBack();
                    },
                    icon: const Icon(Icons.arrow_back)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTabView(
                        color1: viewModel.myTabView == MyTabview.personsal
                            ? const Color(0xff602bf8)
                            : Colors.white,
                        color2: viewModel.myTabView == MyTabview.personsal
                            ? Colors.white
                            : Colors.black,
                        fxn: viewModel.tabFunctionPersonal,
                        text: 'Personal'),
                    MyTabView(
                        color1: viewModel.myTabView == MyTabview.bank
                            ? const Color(0xff602bf8)
                            : Colors.white,
                        color2: viewModel.myTabView == MyTabview.bank
                            ? Colors.white
                            : Colors.black,
                        fxn: viewModel.tabFunctionBankDetails,
                        text: 'Bank Details')
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                viewModel.myTabView == MyTabview.personsal
                    ? PersonalScreen(
                        selectedWidow: widowsDataModel.selectedWidow!,
                        widowsDataModel: widowsDataModel,
                      )
                    : BankDetails(
                        selectedWidow: widowsDataModel.selectedWidow!,
                        widowsDataModel: widowsDataModel,
                      )
              ],
            ),
          )),
        );
      },
    );
  }
}

class MyTabView extends StatelessWidget {
  const MyTabView(
      {super.key,
      required this.color1,
      required this.color2,
      required this.fxn,
      required this.text});
  final String text;
  final Color color1;
  final Color color2;
  final Function fxn;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            fxn();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: color1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 14, color: color2),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
