import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/widgets/average_calculate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dynamic Avegare Calculate",
      theme: ThemeData(
        primarySwatch: Constands.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: AverageCalculate(),
    );
  }
}