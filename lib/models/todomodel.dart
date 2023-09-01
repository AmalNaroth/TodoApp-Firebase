import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoModel {
  String taskTitle;
  String taskDescripction;
  bool ckeckedBox;
  String dateAndTime;
  TodoModel({
    required this.taskTitle,
    required this.taskDescripction,
    required this.ckeckedBox,
    required this.dateAndTime
  });

  Map<String, dynamic> toMap() {
    return {
      'taskTitle': taskTitle,
      'taskDescripction': taskDescripction,
      'ckeckedBox': ckeckedBox,
      'dateAndTime' : dateAndTime
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      taskTitle: map['taskTitle'] as String,
      taskDescripction: map['taskDescripction'] as String,
      ckeckedBox: map['ckeckedBox'] as bool,
      dateAndTime: map['dateAndTime'] as String
    );
  }
}
