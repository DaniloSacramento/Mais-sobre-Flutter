
import 'package:curso__/screens/form_screen.dart';
import 'package:flutter/material.dart';

import 'data/task_inherited.dart';
import 'primeira_tela.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TaskInherited(child: const Tela1() ),
    );
  }
}