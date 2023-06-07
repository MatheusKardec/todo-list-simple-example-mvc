import 'package:flutter/material.dart';

import 'todo_list_controller.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key,});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {

  final TodoListController _controller = TodoListController();
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      _controller.addTask(_taskController.text);
                      _taskController.clear();
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controller.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_controller.tasks[index].title),
                  trailing: Checkbox(
                    value: _controller.tasks[index].isCompleted,
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        _controller.completeTask(index);
                      }
                      setState(() {});
                    },
                  ),
                  onLongPress: () {
                    _controller.removeTask(index);
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}