import 'package:average_calculator/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {

  static List<Lesson> allLessons = [];

  static addLesson(Lesson lesson){
    allLessons.add(lesson);
  }

  static List<String> lessonWords() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }


  static double CalculateAverage(){
    double totalPoint = 0;
    double totalCredit = 0;
    allLessons.forEach((element) {
      totalPoint = totalPoint + (element.creditValue * element.wordValue);
      totalCredit += element.creditValue; 
    });
    return totalPoint/totalCredit;
  }

  static double _changeToPoint(String word) {
    switch (word) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonWords() {
    return lessonWords()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _changeToPoint(e),
          ),
        )
        .toList();
  }

  static List<int> credits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCredits() {
    return credits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
