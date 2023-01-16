import 'package:flutter/material.dart';
import 'package:widows_challenge/PieChart/employment_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmploymentStatus(),
      debugShowCheckedModeBanner: false,
    );
  }
}
