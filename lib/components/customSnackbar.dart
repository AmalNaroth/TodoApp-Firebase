import 'package:flutter/material.dart';

void customSnackBAr(String content, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}