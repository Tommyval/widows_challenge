import 'package:flutter/material.dart';
import 'package:widows_challenge/network/network_helper.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../Models/ngomembership_model.dart';

class Ngomemebership extends StatefulWidget {
  const Ngomemebership({Key? key}) : super(key: key);

  @override
  State<Ngomemebership> createState() => _NgomemebershipState();
}

class _NgomemebershipState extends State<Ngomemebership> {
  List<Ngo> ngoType = [];
  final NetworkHelper _netWorkhelper = NetworkHelper();

  Future<void> getMembership() async {
    await _netWorkhelper.getAssetsFromLocalJson();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMembership();
    });
  }

  List<charts.Series<Ngo, String>> _createSampleData() {
    return [
      charts.Series<Ngo, String>(
        data: ngoType,
        id: 'occupation',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(const Color(0xff039CDD)),
        domainFn: (Ngo employment, _) => employment.member,
        measureFn: (Ngo employment, _) => employment.memberNo,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    _netWorkhelper.affliation.forEach(
      (key, value) {
        ngoType.add(Ngo(member: key, memberNo: value));
      },
    );
    return Container(
      child: Card(child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return charts.PieChart(_createSampleData());
          }
        },
      )

          // SfCircularChart( series: <CircularSeries>[
          //           PieSeries<Ngo, String>(
          //               dataSource: ngoType,
          //               xValueMapper: ((Ngo ngo, _) =>
          //                   ngo.member),
          //               yValueMapper: ((Ngo ngo, _) =>
          //                   ngo.memberNo))
          //         ]),
          ),
    );
  }
}
