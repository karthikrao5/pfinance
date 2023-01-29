import 'package:flutter/material.dart';
import 'package:pfinance/colors.dart';
import 'package:pfinance/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Lato",
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: AppColors.primaryMaterialColor,
        navigationBarTheme:
            const NavigationBarThemeData(backgroundColor: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      ),
      home: const Home(),
    );
  }
}
