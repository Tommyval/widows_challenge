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
  List<ChartModel> chart = [];

  bool loading = true;
  final NetworkHelper _networkHelper = NetworkHelper();
  @override
  void initState() {
    super.initState();
    _networkHelper.getAssetsFromLocalJson();
    getData();
  }

  Future<void> getData() async {
    var chartInfo = await _networkHelper.getAssetsFromLocalJson();

    setState(() {
      chart = chartInfo;
    });
    print(chart.length);
  }

  List<charts.Series<ChartModel, String>> _createSampleData() {
    return [
      charts.Series<ChartModel, String>(
          data: chart,
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

// class _BarchatState extends State<Barchat> {
//   List<ChartModel> chart = [];
//   bool loading = true;
//   final NetworkHelper _networkHelper = NetworkHelper();

//   @override
//   void initState() {
//     super.initState();
//     _networkHelper.getAssetsFromLocalJson();
//     getData();
//   }

//   Future<void> getData() async {
//     var chartInfo = await _networkHelper.getAssetsFromLocalJson();
 
//     setState(() {
//       chart = chartInfo;
//     });   
//   }

  
//   List<charts.Series<ChartModel, String>> _createSampleData() {

//     return [
//       charts.Series<ChartModel, String>(
//           data: chart,
//           id: 'occupation',
//           colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//           domainFn: (ChartModel chatmodel, _) => chatmodel.lga!,
//           measureFn: (ChartModel chatmodel, _) => chatmodel.numberOfChildren)
//     ];
//   }