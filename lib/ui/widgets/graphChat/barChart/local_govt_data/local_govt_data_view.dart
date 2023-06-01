import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/ui/widgets/graphChat/barChart/local_govt_data/local_govt_data_model.dart';

class LocalGovtStatusView extends StatelessWidget {
  const LocalGovtStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocalGovtStatusModel>.reactive(
      viewModelBuilder: () => LocalGovtStatusModel(),
      onViewModelReady: (viewModel) => viewModel.localGovtStatus(),
      builder: (context, viewModel, child) {
        return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 600,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: const Color(0xff717171).withOpacity(0.2),
                  blurRadius: 20.0,
                ),
              ]),
              child: Card(
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return charts.BarChart(
                        viewModel.createSampleData(),
                        animate: false,
                        vertical: false,
                        behaviors: [
                          charts.ChartTitle(
                            'WIDOWS REGISTERED BY LOCAL GOVERNMENT',
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleOutsideJustification:
                                charts.OutsideJustification.start,
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ));
      },
    );
  }
}
