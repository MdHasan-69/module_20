import 'package:get/get.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(String title) {
    tasks.add(Task(title: title));
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    tasks.refresh(); // notify listeners
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
