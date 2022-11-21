// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curso__/data/task_inherited.dart';
import 'package:curso__/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'main.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Tarefas",
            style: TextStyle(fontSize: 28, color: Colors.red),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => Formulario(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(
      {Key? key,
      required this.nome,
      required this.foto,
      required this.dificuldade})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int minLevel = 10;
  int masteryLevel = 1;

  Map<int, Color> mastery = {
    1: Colors.blue,
    2: Colors.yellow,
    3: Colors.orange,
    4: Colors.red,
    5: Colors.purple,
    6: Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: masteryLevel <= mastery.keys.last
                    ? mastery[masteryLevel]
                    : mastery[mastery.keys.last],
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1)
                                      ? Colors.red
                                      : Colors.red[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2)
                                      ? Colors.red
                                      : Colors.red[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3)
                                      ? Colors.red
                                      : Colors.red[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4)
                                      ? Colors.red
                                      : Colors.red[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5)
                                      ? Colors.red
                                      : Colors.red[100]),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                              if ((nivel / widget.dificuldade) >
                                  (minLevel * masteryLevel)) {
                                nivel = 0;
                                masteryLevel++;
                              }
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(Icons.arrow_drop_up),
                              Text(
                                "UP",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.dificuldade > 0
                              ? (nivel / widget.dificuldade) /
                                  (minLevel *
                                      masteryLevel) /*Aqui o nível mínimo é multiplicado pela maestria, então
                            quanto maior a maestria mais difícil é chegar até o fim da barra de progresso*/
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nivel: $nivel",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
