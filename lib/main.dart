import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/landing/landing_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aaditya Cholayil',
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: RouteGenerator.generateRoute,
      // initialRoute: RoutesName.doctorListRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Montserrat'),
      ),
      home: const LandingPage(),
    );
  }
}
