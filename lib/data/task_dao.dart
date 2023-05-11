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

    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      print("a tarefa nao Existia"); // Remover quando for para producao
      /* Se a tarefa nao existe, ela vai ser criada */
      return await bancoDeDados.insert(
        _tablename,
        taskMap,
      );
    } else {
      print("a tarefa ja Existia"); // Remover quando for para producao
      /* Se a tarefa existe, ela vai ser modificada */
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: "$_name = ?",
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print("Convertendo Tarefa em Map: "); // Remover quando for para producao
    final Map<String, dynamic> mapaDeTarefas = Map();
    // final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    print("Mapa de Tarefas: $mapaDeTarefas");
    return mapaDeTarefas;
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

  delete(String nomeDaTarefa) async {
    print(
        "Deletando tarefa: $nomeDaTarefa"); // Remover quando for para producao

    final Database bancoDeDados = await getDatabase(); // Criar conexao

    return bancoDeDados
        .delete(_tablename, where: "$_name = ?", whereArgs: [nomeDaTarefa]);
  }
}
