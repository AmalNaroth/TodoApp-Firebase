import 'package:flutter/material.dart';
import 'package:todoapp_project/components/customSnackbar.dart';
import 'package:todoapp_project/repo/addDataFirestore.dart';

class AddToFireBaseProvider extends ChangeNotifier {
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescripctionController = TextEditingController();
  bool _checkBox = false;

  TextEditingController get taskTitleControllerGet => _taskTitleController;
  TextEditingController get taskDescripctionControllerGet =>
      _taskDescripctionController;

  Future<void> addToFirebase(BuildContext context) async {
    String retrunValue = await AddToFireBase().datasAddToFirebase(
      taskTitle: _taskTitleController.text,
      taskDescripction: _taskDescripctionController.text,
      checkedBox: _checkBox,
    );
    customSnackBAr(retrunValue, context);
    Navigator.of(context).pop();
    _taskTitleController.clear();
    _taskDescripctionController.clear();
    _checkBox = false;
  }
}
