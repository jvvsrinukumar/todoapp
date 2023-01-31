import 'package:flutter/material.dart';
import 'package:todoapp/entites/todo_entity.dart';

import 'package:todoapp/utlis/date_time_utlis.dart';
import 'package:todoapp/utlis/validators_utlis.dart';

class TodoProvider extends ChangeNotifier {
  final TextEditingController _dateController = TextEditingController();

  late DateTime startDate = DateTime.now();
  late DateTime fromDate = DateTime.now();
  late DateTime toDate = DateTime.now();

  ValidationItem _taskName = ValidationItem(null, null);
  ValidationItem _taskDesc = ValidationItem(null, null);
  ValidationItem _date = ValidationItem(null, null);

//Getters
  ValidationItem get taskName => _taskName;
  ValidationItem get taskDesc => _taskDesc;
  ValidationItem get date => _date;

  TextEditingController get dateController => _dateController;
  bool get isValid {
    if (_taskDesc.value != null &&
        _taskName.value != null &&
        _date.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeTaskName(String value) {
    if (value.isEmpty) {
      _taskName = ValidationItem(null, "Task Name can't be empty");
    } else {
      _taskName = ValidationItem(value, null);
    }

    notifyListeners();
  }

  void changeTaskDesc(String value) {
    _taskDesc = ValidationItem(value, null);
    if (value.isEmpty) {
      _taskDesc = ValidationItem(null, "Task Description can't be empty");
    } else {
      _taskDesc = ValidationItem(value, null);
    }
    notifyListeners();
  }

  late DateTime selectedDate = DateTime.now();
  selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: fromDate,
      lastDate: DateTime(2100),
      // initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    notifyListeners();
  }

  // Setters
  void changeDOB(String value) {
    try {
      // converting the DateTime data type into a String data type and only getting the
      // Date(discarding the time)
      value = DateTimeUtil.toDate(selectedDate);
      dateController.text = DateTimeUtil.toDate(selectedDate);
      //selectedDate.toString().split(' ')[0];
      _date = ValidationItem(value, null);
    } catch (error) {
      _date = ValidationItem(null, "Use Correct Format");
    }
    notifyListeners();
  }

  getDateTime(final DateTime date) {
    //print(DateTimeUtil.toDate(date));
    dateController.text = DateTimeUtil.toDate(date);
    _date = ValidationItem(DateTimeUtil.toDate(date), null);
    notifyListeners();
  }

  //  Future pickFromDateTime({required bool pickDate}) async {
  //   final date = await pickDateTime(todo.toDate,
  //       pickDate: pickDate, firstDate: todo.fromDate);
  //   if (date == null) return;
  //   if (date.isBefore(todo.fromDate) || date.isAtSameMomentAs(todo.fromDate)) {
  //     DateTime fromDate =
  //         DateTime(date.year, date.month, date.day, date.hour - 1, date.minute);
  //     //_createSurveyBlock.add(DateChangeEvent(true, fromDate));
  //    // todo.getDateTime(fromDate);
  //   }
  //  // todo.getDateTime(date);
  // }

  // Future<DateTime?> pickDateTime(DateTime initialDate,
  //     {required bool pickDate, DateTime? firstDate}) async {
  //   if (pickDate) {
  //     final date = await showDatePicker(
  //         context: context,
  //         initialDate: initialDate,
  //         firstDate: firstDate ?? DateTime(2015, 8),
  //         lastDate: DateTime(2100));
  //     if (date == null) return null;
  //     final time =
  //         Duration(hours: initialDate.hour, minutes: initialDate.minute);
  //     return date.add(time);
  //   } else {
  //     final timeOfDay = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.fromDateTime(initialDate),
  //     );

  //     if (timeOfDay == null) return null;

  //     final date =
  //         DateTime(initialDate.year, initialDate.month, initialDate.day);
  //     final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
  //     return date.add(time);
  //   }
  // }
}
