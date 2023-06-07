import 'todo_list_model.dart';

class TodoListController {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title: title));
  }

  void completeTask(int index) {
    tasks[index].isCompleted = true;
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}