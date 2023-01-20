import 'package:flutter/material.dart';
import 'package:widows_challenge/Barchart/barchart_occupation.dart';
import 'package:widows_challenge/Barchart/barchart_widows.dart';
import 'package:widows_challenge/Card/lga_register.dart';
import 'package:widows_challenge/Card/widows_register.dart';
import 'package:widows_challenge/PieChart/employment_status.dart';
import 'package:widows_challenge/PieChart/ngomembership.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              WidowRegister(),
              LgaRegister(),
              SizedBox(
                height: 20,
              ),
              EmploymentStatus(),
              Ngomemebership(),
              Barchat(),
              SizedBox(
                height: 20,
              ),
              BarOccupation()
            ],
          ),
        ),
      ),
    );
  }
}
