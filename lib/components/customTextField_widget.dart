import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  String hintText;
  TextEditingController conntroller;
  int? maxLine;
   customTextField({
    super.key,
    required this.hintText,
    required this.conntroller,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: conntroller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        border: InputBorder.none),
    );
  }
}
