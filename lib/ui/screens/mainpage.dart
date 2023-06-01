import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:widows_challenge/ui/widgets/graphChat/pieChart/employment_status/employment_status_view.dart';
import '../../core/Models/widows_Data/widows_card_model.dart';
import '../widgets/graphChat/barChart/local_govt_data/local_govt_data_view.dart';
import '../widgets/graphChat/barChart/occupationData/occupation_data_view.dart';
import '../widgets/graphChat/barChart/yearsinmarriage/yearsinMarriage_view.dart';
import '../widgets/graphChat/pieChart/ngomembership/ngomembership_view.dart';
import '../widgets/drawer/drawer.dart';
import '../widgets/lga_count/lga_count_view.dart';
import '../widgets/widows_count/widows_count_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              WidowsCountView(),
              LgaCountView(),
              SizedBox(
                height: 20,
              ),
              EmploymentStatusChat(),
              NGOStatusChat(),
              LocalGovtStatusView(),
              SizedBox(
                height: 20,
              ),
              OccupationView(),
              SizedBox(
                height: 20,
              ),
              YearsInMarriageView()
            ],
          ),
        ),
      ),
    );
  }
}

