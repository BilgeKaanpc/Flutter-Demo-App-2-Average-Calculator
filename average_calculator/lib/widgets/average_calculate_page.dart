import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:average_calculator/model/lesson.dart';
import 'package:average_calculator/widgets/show_average.dart';
import 'package:flutter/material.dart';

class AverageCalculate extends StatefulWidget {
  const AverageCalculate({super.key});

  @override
  State<AverageCalculate> createState() => _AverageCalculateState();
}

class _AverageCalculateState extends State<AverageCalculate> {
  var formKey = GlobalKey<FormState>();

  double pickedValue = 4;
  double pickedCredit = 4;
  String pickedLesson = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            Constands.titleText,
            style: Constands.titleStyle,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                const Expanded(
                  flex: 1,
                  child: ShowAverage(
                    average: 2.45,
                    lessonCount: 4,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Text("List Area"),
                color: Colors.blue,
              ),
            ),
            //liste
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constands.horizontalPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constands.horizontalPadding8,
                  child: _buildWords(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constands.horizontalPadding8,
                  child: _buildCredits(),
                ),
              ),
              IconButton(
                  onPressed: CalculateAverage,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Constands.mainColor,
                    size: 30,
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          pickedLesson = value.toString();
        });
      },
      validator: (value) {
        if (value!.length <= 0) {
          return "please write lesson name";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        filled: true,
        fillColor: Constands.mainColor.shade100.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: Constands.borderRadius, borderSide: BorderSide.none),
      ),
    );
  }

  _buildWords() {
    return Container(
      alignment: Alignment.center,
      padding: Constands.dropDownPadding,
      decoration: BoxDecoration(
          color: Constands.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constands.borderRadius),
      child: DropdownButton<double>(
        value: pickedValue,
        elevation: 16,
        iconDisabledColor: Constands.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            pickedValue = value!;
          });
        },
        underline: Container(),
        items: DataHelper.allLessonWords(),
      ),
    );
  }

  _buildCredits() {
    return Container(
      alignment: Alignment.center,
      padding: Constands.dropDownPadding,
      decoration: BoxDecoration(
          color: Constands.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constands.borderRadius),
      child: DropdownButton<double>(
        value: pickedCredit,
        elevation: 16,
        iconDisabledColor: Constands.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            pickedCredit = value!;
          });
        },
        underline: Container(),
        items: DataHelper.allCredits(),
      ),
    );
  }

  void CalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currentLesson = Lesson(
          name: pickedLesson,
          wordValue: pickedValue,
          creditValue: pickedCredit);

      DataHelper.addLesson(currentLesson);
      print(currentLesson.toString());
      print(DataHelper.CalculateAverage());
    }
  }
}
