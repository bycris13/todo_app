import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> tasks = [
    Task(title: 'Aprender Flutter POO', completed: false),
    Task(title: 'Practicar Provider', completed: false),
    Task(title: 'Crear app de tareas', completed: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi primera App de Tareas POO'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: ListTile(
                leading: Checkbox(
                    activeColor: Colors.green,
                    value: task.completed,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          task.toggleCompleted();
                        },
                      );
                    }),
                title: Text(
                  task.title,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: task.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              ),
            );
          },
        ));
  }
}
