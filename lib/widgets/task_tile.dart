import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final int isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked == 1 ? TextDecoration.lineThrough : null,
            color: isChecked == 1 ? Colors.deepOrange : null,
            fontWeight: isChecked == 1 ? FontWeight.bold : null),
      ),
      trailing: Checkbox(
        value: isChecked == 1 ? true : false,
        activeColor: Colors.orangeAccent,
        onChanged: (newValue) {
          checkboxCallback(newValue);
        },
      ),
    );
  }
}
