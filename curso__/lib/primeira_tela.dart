// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

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

class Task extends StatelessWidget {
  final String nome;
  const Task({
    Key? key,
    required this.nome,
  }) : super(key: key);

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
                      nome,
                      style: const TextStyle(fontSize: 24,
                      overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_drop_up),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
