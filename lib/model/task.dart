class Task {
  String title;
  bool completed;

  Task({required this.title, this.completed = false});

  // Metodo para aleternar el estado de completado de la tarea.
  void toggleCompleted() {
    completed = !completed;
  }
}
