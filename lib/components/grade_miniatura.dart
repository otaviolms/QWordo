import 'package:flutter/material.dart';

import '../models/partida.dart';

class GradeMiniatura extends StatelessWidget {
  Partida partida;
  bool primeiraSelecao = true;

  GradeMiniatura({Key? key, required this.partida}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffa38bfe),
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            itemCount: partida.letras.length,
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffa38bfe),
                  child: Center(
                    child: Text(
                      partida.letras[index],
                      style: TextStyle(fontSize: 18, color: Color(0xffe2e1f5)),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
