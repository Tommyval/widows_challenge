import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/core/Models/lga_count_model.dart';
import 'package:widows_challenge/ui/widgets/lga_count/lga_count_model.dart';

class LgaCountView extends StatelessWidget {
  const LgaCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LgaCountViewModel>.reactive(
      viewModelBuilder: ()=>LgaCountViewModel(),
      onViewModelReady:(viewModel) => viewModel.LoadLgaCount(),
      builder: (context, viewModel, child) {
        return  Padding(
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
                   viewModel.lgaCount!.lgaCount.toString(),
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

      },
    );
  }
}