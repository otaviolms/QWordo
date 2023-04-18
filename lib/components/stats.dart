import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  String titulo;
  String valor;

  Stats({Key? key, required this.titulo, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(titulo, style: TextStyle(fontSize: 14, color: Color(0xffe2e1f5))),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(valor, style: TextStyle(fontSize: 22, color: Color(0xffe2e1f5))),
          ),
        ],
      ),
    );
  }
}
