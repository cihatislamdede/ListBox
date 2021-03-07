import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_flutter/models/task_data.dart';
import 'package:shopping_list_flutter/screens/add_task_screen.dart';
import 'package:shopping_list_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      floatingActionButton: buildFloatingActionButton(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topArea(context),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Provider.of<TaskData>(context).taskCount != 0
                  ? TasksList()
                  : Image.asset(
                      'assets/empty.png',
                      alignment: Alignment.center,
                      scale: 2,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            child: Icon(
              Icons.list_rounded,
              color: Colors.orange,
              size: 32,
            ),
            backgroundColor: Colors.white,
            radius: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'ListBox',
            style: TextStyle(
                fontSize: 48, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${Provider.of<TaskData>(context).taskCount} Task',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
                  child: Container(
                    child: AddTaskScreen(),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
                  ),
                ),
            isScrollControlled: true);
      },
      backgroundColor: Colors.orangeAccent,
      elevation: 5,
      tooltip: 'Ekle',
      child: const Icon(
        Icons.add,
        size: 36,
      ),
    );
  }
}
