import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widows_challenge/core/Models/employment_model.dart';

import 'employment_status_model.dart';

class EmploymentStatusChat extends StatelessWidget {
  const EmploymentStatusChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmploymentStatusModel>.reactive(
      viewModelBuilder: () => EmploymentStatusModel(),
      onViewModelReady: (viewModel) => viewModel.employmentStatus(),
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
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap),
                        series: <CircularSeries>[
                          DoughnutSeries<EmploymentStatusData, String>(
                              dataSource: viewModel.employmentStatusData,
                              xValueMapper:
                                  ((EmploymentStatusData employment, _) =>
                                      employment.title),
                              yValueMapper:
                                  (EmploymentStatusData employment, _) =>
                                      employment.value,
                              enableTooltip: true)
                        ],
                      );
                    }
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('widows employment',
                        style: GoogleFonts.rubik(fontSize: 15)),
                    Center(
                        child: Text(
                      'status',
                      style: GoogleFonts.rubik(fontSize: 15),
                    ))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
