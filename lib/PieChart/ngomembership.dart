import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widows_challenge/network/network_helper.dart';
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

  @override
  Widget build(BuildContext context) {
    _netWorkhelper.affliation.forEach(
      (key, value) {
        ngoType.add(Ngo(member: key, memberNo: value));
      },
    );
    return Stack(alignment: Alignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color(0xff717171).withOpacity(0.2),
              blurRadius: 20.0,
            ),
          ]),
          height: 500,
          child: Card(child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return SfCircularChart(
                    title: ChartTitle(text: 'WIDOWS AFFLIATION TO NGO'),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: <CircularSeries>[
                      PieSeries<Ngo, String>(
                          dataSource: ngoType,
                          xValueMapper: ((Ngo ngo, _) => ngo.member),
                          yValueMapper: ((Ngo ngo, _) => ngo.memberNo))
                    ]);
              }
            },
          )),
        ),
      ),
    ]);
  }
}
