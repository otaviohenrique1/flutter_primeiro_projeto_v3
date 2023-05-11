import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto_v3/components/task.dart';
import 'package:flutter_primeiro_projeto_v3/data/task_dao.dart';
import 'package:flutter_primeiro_projeto_v3/data/task_inherited.dart';
import 'package:flutter_primeiro_projeto_v3/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                /* none: Este é o valor inicial e indica que não há conexão em andamento. */
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando"),
                    ],
                  ),
                );
              // break;
              case ConnectionState.waiting:
                /* waiting: Indica que a conexão está ativa, mas ainda não retornou nenhum dado. */
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando"),
                    ],
                  ),
                );
              // break;
              case ConnectionState.active:
                /* active: Indica que a conexão está ativa e atualmente está transmitindo dados. */
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando"),
                    ],
                  ),
                );
              // break;
              case ConnectionState.done:
                /* done: Indica que a conexão foi concluída e não está mais transmitindo dados. */
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final Task tarefa = items[index];
                        return;
                      },
                    );
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          "Não há nenhuma Tarefa",
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
                }
                return const Text("Erro ao carregar Tarefas");
              // break;
              // default:
            }
            return const Text("Erro desconhecido");
          },
        ),
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
