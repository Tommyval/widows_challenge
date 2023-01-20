import 'package:flutter/material.dart';
import 'package:widows_challenge/Models/occupation_model.dart';
import 'package:widows_challenge/network/network_helper.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class BarOccupation extends StatefulWidget {
  const BarOccupation({Key? key}) : super(key: key);

  @override
  State<BarOccupation> createState() => _BarOccupationState();
}

class _BarOccupationState extends State<BarOccupation> {
  List<WorkType> differentWork = [];
  final NetworkHelper difnetworkHelper = NetworkHelper();
  Future<void> getWork() async {
    await difnetworkHelper.getAssetsFromLocalJson();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getWork();
    });
  }

  List<charts.Series<WorkType, String>> _createSampleData() {
    return [
      charts.Series<WorkType, String>(
        data: differentWork,
        id: 'occupation',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(const Color(0xff039CDD)),
        domainFn: (WorkType worktype, _) => worktype.works,
        measureFn: (WorkType workType, _) => workType.workNo,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    difnetworkHelper.occupy.forEach(
      (key, value) {
        differentWork.add(WorkType(works: key, workNo: value));
      },
    );
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
                  _createSampleData(),
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
  }
}
