import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:average_calculator/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss,super.key});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLesson = DataHelper.allLessons;
    return allLesson.length > 0
        ? ListView.builder(
            itemCount: allLesson.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a){
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLesson[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constands.mainColor,
                        child: Text(
                          (allLesson[index].wordValue *
                                  allLesson[index].creditValue)
                              .toStringAsFixed(0),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: Text(
                          "Credits: ${allLesson[index].creditValue} - Points: ${allLesson[index].wordValue}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text("Please add lesson",style: Constands.titleStyle,),
            ),
          );
  }
}
