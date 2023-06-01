import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/ui/widgets/graphChat/barChart/occupationData/occupation_data_model.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
class OccupationView extends StatelessWidget {
  const OccupationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OccupationStatusModel>.reactive(
      viewModelBuilder: ()=> OccupationStatusModel(),
      onViewModelReady:(viewModel) => viewModel.occupationStatus(),
      builder: (context, viewModel, child) {
        return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xff717171).withOpacity(0.2),
            blurRadius: 20.0,
          ),
        ]),
        height: 700,
        child: Card(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return charts.BarChart(
                  viewModel.createSampleData(),
                  animate: false,
                  behaviors: [
                    charts.ChartTitle(
                      'WIDOWS TYPE OF OCCUPATION',
                      behaviorPosition: charts.BehaviorPosition.top,
                      titleOutsideJustification:
                          charts.OutsideJustification.start,
                    )
                  ],
                  domainAxis: const charts.OrdinalAxisSpec(
                      renderSpec: charts.SmallTickRendererSpec(
                          minimumPaddingBetweenLabelsPx: 0,
                          labelAnchor: charts.TickLabelAnchor.centered,
                          labelStyle: charts.TextStyleSpec(
                            fontSize: 10,
                            color: charts.MaterialPalette.black,
                          ),
                          labelRotation: 45)),
                );
              }
            },
          ),
        ),
      ),
    );

      },
    );
  }
}