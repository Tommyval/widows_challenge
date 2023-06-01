import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/core/Models/widows_count_model.dart';
import 'package:widows_challenge/ui/widgets/widows_count/widows_count_model.dart';

class WidowsCountView extends StatelessWidget {
  const WidowsCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WidowsCountModel>.reactive(
      viewModelBuilder: () => WidowsCountModel(),
      onViewModelReady: (viewModel) => viewModel.fetchWidowsCount(),
      builder: (context, viewModel, child) {
         
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
                       viewModel.widowsCount!.count.toString(),
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
      },
    );
  }
}
