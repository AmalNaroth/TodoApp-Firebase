import 'package:flutter/material.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';

class CustomRadioWidget extends StatelessWidget {
  Color catColor;
  String radioTitle;
   CustomRadioWidget({
    super.key,
    required this.radioTitle,
    required this.catColor
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: catColor),
      child: RadioListTile(
        contentPadding: EdgeInsets.zero,
        title: Transform.translate(
          offset: Offset(-22, 0),
          child: TextStyleWidget(value: radioTitle)),
        value: 1, groupValue: 0, onChanged: (value) {
      },),
    );
  }
}