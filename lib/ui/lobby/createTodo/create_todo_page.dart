import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/entites/todo_entity.dart';
import 'package:todoapp/resources/color_manager.dart';
import 'package:todoapp/resources/font_manager.dart';
import 'package:todoapp/resources/style_manager.dart';
import 'package:todoapp/resources/value_manager.dart';
import 'package:todoapp/ui/lobby/servies/todo_service.dart';
import 'package:todoapp/ui/lobby/createTodo/todo_provider.dart';

class CreateTodoPage extends StatefulWidget {
  final ToDo? todoTask;
  final String? taskID;
  const CreateTodoPage(
      {super.key, required this.todoTask, required this.taskID});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  late TodoProvider todoProvider;

  @override
  void initState() {
    todoProvider = Provider.of<TodoProvider>(context, listen: false);
    if (widget.todoTask != null) {
      todoProvider.setEditValues(widget.todoTask!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ColorManager.todoBackground,
          title: Text(
            widget.todoTask == null ? "Add new thing" : "Edit Todo Item",
            style: getRegularStyle(
                color: ColorManager.primary, fontSize: FontSizes.s17),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_sharp),
            iconSize: 22,
            color: ColorManager.buttonColor,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.tune),
              iconSize: 25,
              color: ColorManager.buttonColor,
            ),
          ],
        ),
        body: Consumer<TodoProvider>(builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Container(
              height: (MediaQuery.of(context).size.height),
              color: ColorManager.todoBackground,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      FittedBox(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.todoBackground,
                            radius: 29.5,
                            child: Icon(
                              Icons.brush,
                              color: ColorManager.buttonColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        controller: todoProvider.taskNameController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        style: getSemiBoldStyle(
                            fontSize: FontSizes.s16,
                            color: ColorManager.primary),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white24), //<-- SEE HERE
                          ),

                          hintText: "Task Name",

                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          errorText: todoProvider.taskName.error,
                          errorStyle: TextStyle(
                              color: ColorManager.error,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          //hintStyle: getSemiBoldStyle(fontSize:FontSize.s20,color: ColorManager.primary),
                        ),
                        onChanged: (val) {
                          todoProvider.changeTaskName(val);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: todoProvider.taskDescController,
                        obscureText: false,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 5,
                        style: getSemiBoldStyle(
                            fontSize: FontSizes.s16,
                            color: ColorManager.primary),
                        decoration: InputDecoration(
                          hintText: "Description",
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white24), //<-- SEE HERE
                          ),
                          //fillColor: Colors.red,
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          errorText: todoProvider.taskDesc.error,
                          errorStyle: TextStyle(
                              color: ColorManager.error,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          //hintStyle: getSemiBoldStyle(fontSize:FontSize.s20,color: ColorManager.primary),
                        ),
                        onChanged: (val) {
                          todoProvider.changeTaskDesc(val);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: todoProvider.dateController,
                        readOnly: true,
                        style: getSemiBoldStyle(
                            fontSize: FontSizes.s16,
                            color: ColorManager.primary),
                        decoration: InputDecoration(
                          hintText: "Date",
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white24), //<-- SEE HERE
                          ),
                          //fillColor: Colors.red,
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          // errorText: snapshot.hasError
                          //     ? snapshot.error.toString()
                          //     : null,
                          errorStyle: TextStyle(
                              color: ColorManager.error,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          //hintStyle: getSemiBoldStyle(fontSize:FontSize.s20,color: ColorManager.primary),
                        ),
                        onChanged: (String value) {
                          todoProvider.changeDOB(value);
                        },
                        onTap: () {
                          pickFromDateTime(pickDate: true);
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: AppSize.s50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.buttonColor,
                              shadowColor: Colors.black,
                              elevation: 20,
                            ),
                            onPressed: () {
                              // print(todoProvider.date.value!);
                              if (todoProvider.isValid) {
                                ToDo task = ToDo(
                                    date: todoProvider.date.value!,
                                    taskDesc: todoProvider.taskDesc.value!,
                                    taskName: todoProvider.taskName.value!);
                                if (widget.todoTask != null) {
                                  TodoService().updateByID(
                                      task.toJson(), widget.taskID!);
                                  Navigator.pop(context);
                                } else {
                                  TodoService().add(task.toJson());
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: Text(
                              widget.todoTask != null
                                  ? "Update".toUpperCase()
                                  : "Add new thing".toUpperCase(),
                              style: getSemiBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSizes.s14),
                            )),
                      ),
                    ],
                  )),
            ),
          );
        }));
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
        widget.todoTask != null
            ? DateFormat.yMMMEd().parse(widget.todoTask!.date)
            : todoProvider.toDate,
        pickDate: pickDate,
        firstDate: todoProvider.fromDate);
    if (date == null) return;
    if (date.isBefore(todoProvider.fromDate) ||
        date.isAtSameMomentAs(todoProvider.fromDate)) {
      DateTime fromDate =
          DateTime(date.year, date.month, date.day, date.hour - 1, date.minute);
      //_createSurveyBlock.add(DateChangeEvent(true, fromDate));
      todoProvider.getDateTime(fromDate);
    }
    todoProvider.getDateTime(date);
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, DateTime? firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2100));
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }
}
