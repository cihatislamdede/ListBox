import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_flutter/models/task_data.dart';
import 'package:shopping_list_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: EdgeInsets.only(right: 16),
                  alignment: Alignment.centerRight,
                  color: Colors.redAccent.shade200,
                  child: Icon(
                    Icons.delete,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  taskData.deleteTask(task);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "'${task.name}' deleted.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                  );
                },
                key: Key(task.name),
                child: TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                ),
              );
            });
      },
    );
  }
}
