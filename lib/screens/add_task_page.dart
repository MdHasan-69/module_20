import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class AddTaskPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TaskController taskController = Get.find();
  final _formKey = GlobalKey<FormState>();

  void save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      taskController.addTask(_controller.text);
      Get.back(); // close the page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Task Title'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a task name'
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => save(context),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
