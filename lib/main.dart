import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app_setup.locator.dart';
import 'app/app_setup.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
     initialRoute: Routes.mainPage,
    );
  }
}
