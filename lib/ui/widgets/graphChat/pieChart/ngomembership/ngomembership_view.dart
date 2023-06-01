import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/Models/ngomembership_model.dart';
import 'ngomembership_model.dart';

class NGOStatusChat extends StatelessWidget {
  const NGOStatusChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NGOStatusModel>.reactive(
      viewModelBuilder: () => NGOStatusModel(),
      onViewModelReady: (viewModel) => viewModel.nGOStatus(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: const Color(0xff717171).withOpacity(0.2),
                    blurRadius: 20.0,
                  ),
                ]),
                height: 500,
                child: Card(
                  child: FutureBuilder(builder: (context, snapshot) {
                    if (ConnectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return SfCircularChart(
                        title: ChartTitle(text: 'WIDOWS AFFLIATION TO NGO'),
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap),
                        series: <CircularSeries>[
                          PieSeries<NGOAffiliation, String>(
                              dataSource: viewModel.nGoStatusData,
                              xValueMapper: ((NGOAffiliation ngo, _) =>
                                  ngo.title),
                              yValueMapper: (NGOAffiliation ngo, _) =>
                                  ngo.value,
                              enableTooltip: true)
                        ],
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
