// todo_list_page.dart
import 'package:flutter/material.dart';
import 'add_task_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> tasks = [];

  void _navigateAndAddTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );

    if (result != null && result is String && result.isNotEmpty) {
      setState(() {
        tasks.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDoアプリ')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(tasks[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAndAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
