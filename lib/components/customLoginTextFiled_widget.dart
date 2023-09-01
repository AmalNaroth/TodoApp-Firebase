import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {

  TextEditingController controller;
  IconData icon;
  String hinttext;
  String valueKey;

   TextFormFieldWidget({super.key,required this.controller,required this.icon,required this.hinttext,required this.valueKey});

  @override
  Widget build(BuildContext context) {
    final bordervalue=OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 134, 134, 134),
          ),
          borderRadius: BorderRadius.circular(7),
        );
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty ){
          return "Incorrect $valueKey fill it";
        }
        return null;
      },
      key: ValueKey(valueKey),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hinttext,
        enabledBorder: bordervalue,
        focusedBorder: bordervalue),
      );
  }
}