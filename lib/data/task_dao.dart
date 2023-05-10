import 'package:flutter_primeiro_projeto_v3/components/task.dart';
import 'package:flutter_primeiro_projeto_v3/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = "CREATE TABLE $_tablename ("
      "$_name TEXT, "
      "$_difficulty INTEGER, "
      "$_image TEXT"
      ")";

  static const String _tablename = "taskTable";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  save(Task tarefa) async {
    print("Iniciando o save: "); // Remover quando for para producao

    final Database bancoDeDados = await getDatabase(); // Criar conexao

    var itemExists =
        await find(tarefa.nome); // Busca se a tarefa existe no banco de dados

    if (itemExists.isEmpty) {
      print("a tarefa nao Existia");
      return await bancoDeDados.insert(
        _tablename,
      );
    }
  }

  Future<List<Task>> findAll() async {
    print("Acessando o findAll: "); // Remover quando for para producao

    final Database bancoDeDados = await getDatabase(); // Criar conexao

    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);

    print(
        "Procurando dados no banco de dados... encontrado: $result"); // Remover quando for para producao

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print("Convertendo to List:");

    final List<Task> tarefas = [];

    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }

    print("Lista de tarefas $tarefas"); // Remover quando for para producao

    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print("Acessando o findAll: "); // Remover quando for para producao

    final Database bancoDeDados = await getDatabase(); // Criar conexao

    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: "$_name = ?", whereArgs: [nomeDaTarefa]);

    print(
        "Tarefa encontrada: ${toList(result)}"); // Remover quando for para producao

    return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}
