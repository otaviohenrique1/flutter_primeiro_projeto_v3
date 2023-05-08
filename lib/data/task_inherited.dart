import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto_v3/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    // ignore: prefer_const_constructors
    Task("Aprender Dart", "assets/images/dart_logo.png", 3),
    // ignore: prefer_const_constructors
    Task("Aprender Javascript", "assets/images/javascript_logo.png", 2),
    // ignore: prefer_const_constructors
    Task("Aprender PHP", "assets/images/php_logo.png", 2),
    // ignore: prefer_const_constructors
    Task("Aprender C#", "assets/images/c_sharp_logo.png", 3),
    // ignore: prefer_const_constructors
    Task("Aprender Python", "assets/images/python_logo.png", 4),
    // ignore: prefer_const_constructors
    Task("Aprender R", "assets/images/r_logo.png", 5),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, "No found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    /*
      oldWidget => observa o estado anterior do componente
      updateShouldNotify for true => notifica todo mundo da mudança do estado
      updateShouldNotify for false => nao notifica a mudança do estado
    */
    return oldWidget.taskList.length != taskList.length;
  }
}

/*
  O BuildContext é um objeto que fornece informações sobre a localização atual do widget na árvore de widgets. É um argumento obrigatório para muitos métodos dentro do Flutter e é usado para recuperar informações, como a localização do tema atual, o objeto Navigator, etc.
  O BuildContext é geralmente usado em conjunto com o método BuildContext.of(), que é usado para recuperar informações do contexto atual.
*/
