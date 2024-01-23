import 'package:average_calculator/constants/app_constant.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lessonCount;
  const ShowAverage(
      {required this.average, required this.lessonCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? "Added: $lessonCount " : "Pick Lesson",
          style: Constands.lessonCountText,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constands.averageTextStyle,
        ),
        Text("Average",
          style: Constands.lessonCountText,),
      ],
    );
  }
}
