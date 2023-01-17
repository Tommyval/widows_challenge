import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widows_challenge/Models/employment_model.dart';
import 'package:widows_challenge/network/network_helper.dart';

class EmploymentStatus extends StatefulWidget {
  const EmploymentStatus({Key? key}) : super(key: key);

  @override
  State<EmploymentStatus> createState() => _EmploymentStatusState();
}

class _EmploymentStatusState extends State<EmploymentStatus> {
  List<Employment> employmentType = [];
  final NetworkHelper _netWorkhelper = NetworkHelper();

  Future<void> getEmployment() async {
    await _netWorkhelper.getAssetsFromLocalJson();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getEmployment();
    });
  }

  // List<charts.Series<Employment, String>> _createSampleData() {
  //   return [
  //     charts.Series<Employment, String>(
  //       data: employmentType,
  //       id: 'occupation',
  //       colorFn: (_, __) =>
  //           charts.ColorUtil.fromDartColor(const Color(0xff039CDD)),
  //       domainFn: (Employment employment, _) => employment.emp,
  //       measureFn: (Employment employment, _) => employment.empNo,
  //     )
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    _netWorkhelper.empment.forEach(
      (key, value) {
        employmentType.add(Employment(emp: key, empNo: value));
      },
    );
    return Scaffold(
      body: SizedBox(
        height: 500,
        child: Card(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (ConnectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                // return charts.PieChart(
                //   animate: false,
                //   _createSampleData(),
                // );
                //
                return SfCircularChart(palette: const <Color>[
                  Colors.amber,
                  Colors.brown,
                  Colors.green,
                  Colors.redAccent,
                  Colors.blueAccent
                ], series: <CircularSeries>[
                  PieSeries<Employment, String>(
                      dataSource: employmentType,
                      xValueMapper: ((Employment employment, _) =>
                          employment.emp),
                      yValueMapper: ((Employment employment, _) =>
                          employment.empNo))
                ]);
              }
            },
          ),
        ),
      ),
    );
  }
}
