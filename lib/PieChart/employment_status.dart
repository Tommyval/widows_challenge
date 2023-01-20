import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  late TooltipBehavior _tooltipBehavior;

  Future<void> getEmployment() async {
    await _netWorkhelper.getAssetsFromLocalJson();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getEmployment();
    });
  }

  @override
  Widget build(BuildContext context) {
    _netWorkhelper.empment.forEach(
      (key, value) {
        employmentType.add(Employment(emp: key, empNo: value));
      },
    );
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color(0xff717171).withOpacity(0.2),
              blurRadius: 20.0,
            ),
          ]),
          height: 500,
          child: Card(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (ConnectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return SfCircularChart(
                      tooltipBehavior: _tooltipBehavior,
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: <CircularSeries>[
                        DoughnutSeries<Employment, String>(
                            dataSource: employmentType,
                            xValueMapper: ((Employment employment, _) =>
                                employment.emp),
                            yValueMapper: ((Employment employment, _) =>
                                employment.empNo),
                            enableTooltip: true)
                      ]);
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('widows employment', style: GoogleFonts.rubik(fontSize: 15)),
              Center(
                  child: Text(
                'status',
                style: GoogleFonts.rubik(fontSize: 15),
              ))
            ],
          ),
        )
      ]),
    );
  }
}
