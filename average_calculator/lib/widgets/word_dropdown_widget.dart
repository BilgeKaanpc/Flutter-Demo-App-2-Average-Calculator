import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

class WordDropDownWidget extends StatefulWidget {
  final Function onWordPicked;
  const WordDropDownWidget({required this.onWordPicked,super.key});


  @override
  State<WordDropDownWidget> createState() => _WordDropDownWidgetState();
}

class _WordDropDownWidgetState extends State<WordDropDownWidget> {
  
  double pickedValue = 4;
  @override
  Widget build(BuildContext context) {
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
            widget.onWordPicked(pickedValue);
          });
        },
        underline: Container(),
        items: DataHelper.allLessonWords(),
      ),
    );
  }
}