import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nome",
                      fillColor: Colors.white70,
                      filled: true
                    ),
                    
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: dificuldadeController,
                    decoration: const  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Dificuldade",
                      fillColor: Colors.white70,
                      filled: true
                    ),
                    
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: imageController,
                    decoration: const  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Image",
                      fillColor: Colors.white70,
                      filled: true
                    ),
                    
                  ),
                  
                ),
                ElevatedButton(onPressed: (){
                  print(nameController.text);
                   print(int.parse(dificuldadeController.text));
                    print(imageController.text);
                }, child: Text("Adicionar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}