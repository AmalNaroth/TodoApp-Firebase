import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/view_models/addDataFirebase_viewmodel.dart.dart';

class NewTaskProvider extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDateGet => _selectedDate;

  TimeOfDay _selectedTime=TimeOfDay.now();
  TimeOfDay get slectedTimeGet=>_selectedTime;

  Future<Null> selectDate(BuildContext context) async {
    final taskDateProvider= context.read<AddToFireBaseProvider>();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 30)));
    if (picked != null) {
      _selectedDate = picked;
    }
    taskDateProvider.taskDateSet=_selectedDate;
    notifyListeners();
  }

  Future<Null> selectTime(BuildContext context) async {
    final taskTimeProvider= context.read<AddToFireBaseProvider>();
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        initialEntryMode: TimePickerEntryMode.dial);
         if(timeOfDay!=null){
          _selectedTime=timeOfDay;
         }
         taskTimeProvider.taskTimeSet=_selectedTime;
         notifyListeners();
  }

}
