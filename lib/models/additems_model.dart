import 'package:flutter/material.dart';

class TodoModel {
  String taskTitle;
  String taskDescripction;
  bool ckeckedBox;
  DateTime taskDate;
  TodoModel({
    required this.taskTitle,
    required this.taskDescripction,
    required this.ckeckedBox,
    required this.taskDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskTitle': taskTitle,
      'taskDescripction': taskDescripction,
      'ckeckedBox': ckeckedBox,
      'taskDate': taskDate,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      taskTitle: map['taskTitle'] as String,
      taskDescripction: map['taskDescripction'] as String,
      ckeckedBox: map['ckeckedBox'] as bool,
      taskDate:map['taskDate'] as DateTime,
    );
  }
}
