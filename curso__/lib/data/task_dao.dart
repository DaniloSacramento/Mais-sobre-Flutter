import 'package:curso__/data/database.dart';
import 'package:curso__/primeira_tela.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  static const String _tablename = "taskTable";
  static const String _name = "nome";
  static const String _image = "imagem";
  static const String _difficulty = "dificuldade";

  save(Task tarefa) async {}
  Future<List<Task>> findAll() async {
    print("Acessando o findAll");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print("Procurando DADOS $result");
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> listaDeTarefas) {
    print("Convertendo TO LIST");
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in listaDeTarefas) {
      final Task tarefa = Task(
          nome: linha[_name],
          foto: linha[_image],
          dificuldade: linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print("Lista de Tarefas $tarefas");
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print("Acessando o find");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: "$_name = ? ", whereArgs: [nomeDaTarefa],);
        print("Tarefa encontrada: ${toList(result)}");
        return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}
