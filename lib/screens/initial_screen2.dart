import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto_v3/data/task_inherited.dart';
import 'package:flutter_primeiro_projeto_v3/screens/form_screen.dart';

class InitialScreen2 extends StatefulWidget {
  const InitialScreen2({super.key});

  @override
  State<InitialScreen2> createState() => _InitialScreen2State();
}

class _InitialScreen2State extends State<InitialScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 7, bottom: 70),
        children: TaskInherited.of(context).taskList,
        // children: const [
        //   Task("Aprender Dart", "assets/images/dart_logo.png", 3),
        //   Task("Aprender Javascript", "assets/images/javascript_logo.png", 2),
        //   Task("Aprender PHP", "assets/images/php_logo.png", 2),
        //   Task("Aprender C#", "assets/images/c_sharp_logo.png", 3),
        //   Task("Aprender Python", "assets/images/python_logo.png", 4),
        //   Task("Aprender R", "assets/images/r_logo.png", 5),
        //   SizedBox(
        //     height: 80,
        //   )
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        opacity: (opacidade) ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task("Aprender Dart", "assets/images/dart_logo.png", 3),
            Task("Aprender Javascript", "assets/images/javascript_logo.png", 2),
            Task("Aprender PHP", "assets/images/php_logo.png", 2),
            Task("Aprender C#", "assets/images/c_sharp_logo.png", 3),
            Task("Aprender Python", "assets/images/python_logo.png", 4),
            Task("Aprender R", "assets/images/r_logo.png", 5),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
*/
