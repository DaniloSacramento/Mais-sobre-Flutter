import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas",
          style: TextStyle(
            fontSize: 28
          ),
        ),
      ),
      body: Container(
          color: Colors.amber,
      ),
      floatingActionButton: 
      FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add),),
    );
  }
}
