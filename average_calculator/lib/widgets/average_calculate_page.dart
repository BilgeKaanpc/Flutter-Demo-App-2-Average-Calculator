import 'package:average_calculator/constants/app_constant.dart';
import 'package:flutter/material.dart';

class AverageCalculate extends StatefulWidget {
  const AverageCalculate({super.key});

  @override
  State<AverageCalculate> createState() => _AverageCalculateState();
}

class _AverageCalculateState extends State<AverageCalculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(Constands.titleText),
      ),
      body: Center(
        child: Text("Hi"),
      ),
    );
  }
}