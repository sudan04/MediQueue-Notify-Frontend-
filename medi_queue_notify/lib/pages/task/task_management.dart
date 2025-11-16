import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/task.dart';
import 'package:medi_queue_notify/pages/task/task_page.dart';
import 'package:medi_queue_notify/utils/lists.dart';
import 'package:medi_queue_notify/widgets/task_tile.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Task Management",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10),
            child: IconButton(
              onPressed: () async {
                final TaskModel newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskPage()),
                );

                setState(() {
                  Lists.taskList.add(newTask);
                });
              },
              icon: Icon(Icons.add, semanticLabel: "Add Task"),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: Lists.taskList.map((e) => TaskTile(task: e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}