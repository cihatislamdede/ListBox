class Task {
  late String name;
  late int isDone;

  Task({required this.name, this.isDone = 0});


  void toggleDone() {
    isDone = isDone == 0 ? 1 : 0;
  }

}
