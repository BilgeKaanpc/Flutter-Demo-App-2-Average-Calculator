import 'package:average_calculator/constants/app_constant.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropDownWidget extends StatefulWidget {
  final Function onCreditPicked;
  const CreditDropDownWidget({required this.onCreditPicked,super.key});


  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double pickedCredit = 4;
  @override
  Widget build(BuildContext context) {
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
            widget.onCreditPicked(pickedCredit);
          });
        },
        underline: Container(),
        items: DataHelper.allCredits(),
      ),
    );
  }
}