import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/widgets/average_calculate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dynamic Avegare Calculate",
      theme: ThemeData(
        primarySwatch: Constands.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const AverageCalculate(),
    );
  }
}