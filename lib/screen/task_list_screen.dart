import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> tasks = [];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App de Tareas'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Escribe una tarea',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {
                        final String text = _controller.text.trim();
                        if (text.isNotEmpty) {
                          setState(() {
                            tasks.add(Task(title: text, completed: false));
                            _controller.clear();
                          });
                        }
                      },
                      child: const Text('Agregar')),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 9.0),
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
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
