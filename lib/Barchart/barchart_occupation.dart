import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:widows_challenge/Models/barchart_occu_model.dart';

class Barchat extends StatelessWidget {
  const Barchat({Key? key}) : super(key: key);

  static List<charts.Series<BaroccuModel, String>> _createSampleData() {
    final data = [
      BaroccuModel(occupation: 'professional', value: 4),
      BaroccuModel(occupation: 'Cleric', value: 2),
      BaroccuModel(occupation: 'Sales', value: 3),
      BaroccuModel(occupation: 'Skilled Manual', value: 4),
      BaroccuModel(occupation: 'Skilled Unmanual', value: 3),
      BaroccuModel(occupation: 'Agriculture', value: 3),
    ];
    return [
      charts.Series<BaroccuModel, String>(
        data: data,
        id: 'occupation',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BaroccuModel baroccumodel, _) => baroccumodel.occupation,
        measureFn: (BaroccuModel baroccumodel, _) => baroccumodel.value,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
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
