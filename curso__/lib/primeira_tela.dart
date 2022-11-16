// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: const Text(
          "Tarefas",
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: ListView(
        
        children: const [
          Task(nome: "Aprender Flutter"),
          Task(
            nome: 'Andar de bike',
          ),
          Task(
            nome: "Meditar",
          ),
          Task(
            nome: "Meditar",
          ),
          Task(
            nome: "Meditar",
          ),
          Task(
            nome: "Meditar",
          ),
          Task(
            nome: "Meditar",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;


  const Task({
    Key? key,
    required this.nome,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: const TextStyle(fontSize: 24,
                          overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                          
                          print(nivel);
                        },
                        child: const Icon(Icons.arrow_drop_up),
                      )
                    ],
                  ),
                ),
                 Text("Nivel: $nivel", 
                style: TextStyle(fontSize: 16,
                color: Colors.white
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
