import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:widows_challenge/network/network_helper.dart';

import '../Models/widow_model.dart';

class Barchat extends StatefulWidget {
  const Barchat({Key? key}) : super(key: key);

  @override
  State<Barchat> createState() => _BarchatState();
}

class _BarchatState extends State<Barchat> {
  List<ChartModel> chat = [];
  bool loading = true;
  final NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var response = await _networkHelper.get(
        'https://dl.dropbox.com/s/i8za3yyicvp5qhe/Forged%20Widows%20Data.json?dl=0');
    List<ChartModel> tempdata = chartModelFromJson(response.body);
    setState(() {
      chat = tempdata;
      loading = false;
    });
  }

  List<charts.Series<ChartModel, String>> _createSampleData() {
    return [
      charts.Series<ChartModel, String>(
          data: chat,
          id: 'occupation',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (ChartModel chatmodel, _) => chatmodel.lga!,
          measureFn: (ChartModel chatmodel, _) => chatmodel.numberOfChildren)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : SizedBox(
                height: 300,
                child: charts.BarChart(
                  _createSampleData(),
                  animate: false,
                ),
              ),
      ),
    );
  }
}
