import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:average_calculator/model/lesson.dart';
import 'package:average_calculator/widgets/credit_dropdown_widget.dart';
import 'package:average_calculator/widgets/lesson_list.dart';
import 'package:average_calculator/widgets/show_average.dart';
import 'package:average_calculator/widgets/word_dropdown_widget.dart';
import 'package:flutter/material.dart';

class AverageCalculate extends StatefulWidget {
  const AverageCalculate({super.key});

  @override
  State<AverageCalculate> createState() => _AverageCalculateState();
}

class _AverageCalculateState extends State<AverageCalculate> {
  var formKey = GlobalKey<FormState>();
  double pickedWordFromWidget = 4;
  double pickedCreditFromWidget = 4;
  String pickedLesson = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
               Expanded(
                  flex: 1,
                  child: ShowAverage(
                    average: DataHelper.CalculateAverage(),
                    lessonCount: DataHelper.allLessons.length,
                  ),
                ),
              ],
            ),
            Expanded(
              child: LessonList(
                onDismiss: (index){
                  setState(() {
                  DataHelper.allLessons.removeAt(index);
                  });
                },
              )
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
                  child: WordDropDownWidget(
                    onWordPicked: (v){
                      pickedWordFromWidget = v;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constands.horizontalPadding8,
                  child: CreditDropDownWidget(
                    onCreditPicked: (v){
                      pickedCreditFromWidget = v;
                    },
                  ),
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

  }

  _buildCredits() {
  }

  void CalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currentLesson = Lesson(
          name: pickedLesson,
          wordValue: pickedWordFromWidget,
          creditValue: pickedCreditFromWidget);

      DataHelper.addLesson(currentLesson);
      print(currentLesson.toString());
      print(DataHelper.CalculateAverage());
      setState(() {
        
      });
    }
  }
}
