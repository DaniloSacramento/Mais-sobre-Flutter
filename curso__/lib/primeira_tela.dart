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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Task(nome: "Aprender Flutter"),
          Task( nome: 'Andar de bike',),
          Task(nome: "Meditar",),
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
    return Container(
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
                   Text(
                    nome,
                    style: TextStyle(fontSize: 26),
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
      );
  }
}
