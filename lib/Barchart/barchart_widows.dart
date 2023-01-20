import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:widows_challenge/Models/lga_model.dart';
import 'package:widows_challenge/network/network_helper.dart';

class Barchat extends StatefulWidget {
  const Barchat({Key? key}) : super(key: key);

  @override
  State<Barchat> createState() => _BarchatState();
}

class _BarchatState extends State<Barchat> {
  List<LgaModel> localgovt = [];
  final NetworkHelper _networkHelper = NetworkHelper();
  Future<void> getData() async {
    await _networkHelper.getAssetsFromLocalJson();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getData();
    });
  }

  List<charts.Series<LgaModel, String>> _createSampleData() {
    return [
      charts.Series<LgaModel, String>(
          data: localgovt,
          id: 'lga',
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(const Color(0xff602BF8)),
          domainFn: (LgaModel lgamodel, _) => lgamodel.lga,
          measureFn: (LgaModel lgamodel, _) => lgamodel.widowsRegistered)
    ];
  }

  @override
  Widget build(BuildContext context) {
    _networkHelper.lga.forEach((key, value) {
      localgovt.add(LgaModel(lga: key, widowsRegistered: value));
    });
    return Container(
      height: 600,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff717171).withOpacity(0.2),
          blurRadius: 20.0,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return charts.BarChart(
                  _createSampleData(),
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
      ),
    );
  }
}
