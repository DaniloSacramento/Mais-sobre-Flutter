import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: Colors.red,
            height: 300,
            width: 300,
          ),
          Container(
            color: Colors.blue,
            width: 150,
            height: 150,
          ),
          Container(
            color: Colors.yellow,
            width: 75,
            height: 75,
          )
        ],
    );
  }
}