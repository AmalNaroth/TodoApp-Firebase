import 'package:flutter/material.dart';
import 'package:todoapp_project/components/customSnackbar.dart';
import 'package:todoapp_project/repo/addDataFirestore.dart';

class AddToFireBaseProvider extends ChangeNotifier {
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescripctionController = TextEditingController();
  bool _checkBox = false;
  TimeOfDay _taskTime = TimeOfDay.now();
  DateTime _taskDate = DateTime.now();

  TextEditingController get taskTitleControllerGet => _taskTitleController;
  TextEditingController get taskDescripctionControllerGet =>
      _taskDescripctionController;
  set checkBoxSet(bool newValue) => _checkBox = newValue;
  set taskTimeSet(TimeOfDay newTime) => _taskTime = newTime;
  set taskDateSet(DateTime newDate) => _taskDate = newDate;

  Future<void> addToFirebase(BuildContext context) async {
    String retrunValue = await AddToFireBase().datasAddToFirebase(
      taskTitle: _taskTitleController.text,
      taskDescripction: _taskDescripctionController.text,
      taskDate: _taskDate,
      taskTime: _taskTime,
      checkedBox: _checkBox,
    );
    customSnackBAr(retrunValue, context);
    Navigator.of(context).pop();
    _taskTitleController.clear();
    _taskDescripctionController.clear();
    _checkBox = false;
  }
}
