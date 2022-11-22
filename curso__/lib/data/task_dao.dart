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

  save(Task tarefa) async {
    print ("Iniciando o save: ");
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if(itemExists.isEmpty){
      print("a tarefa não existia");
      return await bancoDeDados.insert(_tablename, values );
    }
    else {
      print("A tarefa já existia");
      return await bancoDeDados.update(_tablename, values, where: "$_name = ? ", whereArgs: [tarefa.nome]);
    }
  }
    Map<String, dynamic> toMap(Task tarefa){
      print("Convertendo Tarefa em Map");
      final Map<String, dynamic> mapDetarefas = Map();
      mapDetarefas[_name] = tarefa.nome;
      mapDetarefas[_image] = tarefa.foto;
      mapDetarefas[_difficulty] = tarefa.dificuldade;
      print("Mapa de Tarefas é $mapDetarefas");
      return mapDetarefas;
    }
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
