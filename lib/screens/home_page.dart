import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import 'add_task_page.dart';

class HomePage extends StatelessWidget {
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Manager')),
      body: Obx(() {
        if (taskController.tasks.isEmpty) {
          return Center(child: Text('No tasks yet'));
        }
        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                    decoration:
                    task.isDone ? TextDecoration.lineThrough : null),
              ),
              leading: Checkbox(
                value: task.isDone,
                onChanged: (_) => taskController.toggleTask(index),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => taskController.removeTask(index),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddTaskPage()),
        child: Icon(Icons.add),
      ),
    );
  }
}
