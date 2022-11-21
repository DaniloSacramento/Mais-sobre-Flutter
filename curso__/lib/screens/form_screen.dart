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
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      onChanged: (text){
                        setState(() {
                          
                        });
                      },
                      controller: imageController,
                      decoration: const  InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Image",
                        fillColor: Colors.white70,
                        filled: true
                      ),
                      
                    ),
                    
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.red)
                    ),
                    child: ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageController.text, 
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return Image.asset('assets/images/nophoto.png');
                    },
                    fit: BoxFit.cover,

                    ),
                    
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    print(nameController.text);
                    print(int.parse(dificuldadeController.text));
                    print(imageController.text);
                  }, child: Text("Adicionar"),
                  
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}