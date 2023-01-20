import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widows_challenge/network/network_helper.dart';

class LgaRegister extends StatefulWidget {
  const LgaRegister({Key? key}) : super(key: key);

  @override
  State<LgaRegister> createState() => _LgaRegisterState();
}

class _LgaRegisterState extends State<LgaRegister> {
  final NetworkHelper nethelper = NetworkHelper();
  Future<void> getLga() async {
    await nethelper.getAssetsFromLocalJson();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getLga();
    });
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
                      'SELECT LOCAL GOVERMENT',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff111111)),
                    ),
                    Image.asset('asset/images/Group1.png')
                  ],
                ),
              ),
              Positioned(
                  top: 80,
                  left: 190,
                  child: Text(
                    nethelper.lga.length.toString(),
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700, fontSize: 32),
                  )),
              Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'asset/images/Group2.png',
                    // width: 500,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
