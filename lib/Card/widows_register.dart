import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widows_challenge/network/network_helper.dart';

import '../Models/widow_model.dart';

class WidowRegister extends StatefulWidget {
  const WidowRegister({Key? key}) : super(key: key);

  @override
  State<WidowRegister> createState() => _WidowRegisterState();
}

class _WidowRegisterState extends State<WidowRegister> {
  List<ChartModel> widows = [];
  final NetworkHelper _networkHelper = NetworkHelper();
  Future<void> getNo() async {
    _networkHelper.getAssetsFromLocalJson().then((value) {
      widows = value;
      setState(() {});
      print(widows.length);
    });
  }

  @override
  void initState() {
    getNo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xff717171).withOpacity(0.2),
            blurRadius: 20.0,
          ),
        ]),
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TOTAL NUMBER OF WIDOWS REGISTERED',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff111111)),
                    ),
                    Image.asset('asset/images/grp.png')
                  ],
                ),
              ),
              Positioned(
                  top: 80,
                  left: 140,
                  child: Text(
                    widows.length.toString(),
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w700, fontSize: 32),
                  )),
              Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'asset/images/groups.png',
                    // width: 500,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
