import 'package:flutter/material.dart';
import 'package:widows_challenge/Card/lga_register.dart';
import 'package:widows_challenge/Card/widows_register.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: const [WidowRegister(), LgaRegister()],
        ),
      ),
    );
  }
}
