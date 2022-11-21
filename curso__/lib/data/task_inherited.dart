import 'package:curso__/primeira_tela.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final List<Task> taskList = [
           Task(
            nome: "Aprender Flutter ",
            foto: "assets/images/dash.png",
            dificuldade: 2,
          ),
           Task(
            nome: "Andar de Bike ",
            foto: "assets/images/bike.webp",
            dificuldade: 5,
          ),
           Task(
            nome: "Ler ",
            foto: "assets/images/meditar.jpeg",
            dificuldade: 3,
          ),
           Task(
            nome: "Meditar ",
            foto: "assets/images/livro.jpg",
            dificuldade: 4,
          ),
           Task(
            nome: "Jogar ",
            foto: "assets/images/jogar.jpg",
            dificuldade: 1,
          ),
          ];
  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(nome: name, foto: photo, dificuldade: difficulty));
  }


  final Widget child;

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}