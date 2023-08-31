import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  String value;
  Color? textColor;
  double? textSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;
   TextStyleWidget({super.key,required this.value,this.textColor,this.textSize,this.fontWeight,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return  Text(
      value,style:TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor
      ),
      textAlign: textAlign,
    );
  }
}