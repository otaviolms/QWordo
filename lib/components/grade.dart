import 'package:flutter/material.dart';

import '../models/partida.dart';

class Grade extends StatefulWidget {
  Partida partida;
  bool primeiraSelecao = true;
  void Function(String palavra) onAcertou;

  Grade({Key? key, required this.partida, required this.onAcertou}) : super(key: key);

  @override
  State<Grade> createState() => _GradeState();
}

class _GradeState extends State<Grade> {

  primeiraSelecao(int index) {
    widget.primeiraSelecao = false;
    widget.partida.selecionarTemporariamente(index, true, widget.onAcertou);
  }

  segundaSelecao(int index) {
    widget.primeiraSelecao = true;
    if(widget.partida.verificarContinuacao(index)) {
      widget.partida.selecionarTemporariamente(index, false, widget.onAcertou);
    } else {
      widget.primeiraSelecao = false;
      widget.partida.limparSelecao();
      primeiraSelecao(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
      itemCount: widget.partida.letras.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder()),
                backgroundColor:
                    widget.partida.isSelecionada(index)
                      ? MaterialStateProperty.all<Color>(const Color(0xffa38bfe))
                      : (
                        widget.partida.isMarcada(index)
                          ? MaterialStateProperty.all<Color>(const Color(0xfff4937d))
                          : MaterialStateProperty.all<Color>(const Color(0xff10111a))
                      )
            ),
            onPressed: () {
              setState(() {
                if(widget.primeiraSelecao) primeiraSelecao(index);
                else segundaSelecao(index);
              });
            },
            child: Text(
              widget.partida.letras[index],
              style: const TextStyle(fontSize: 30),
            ),
          ),
        );
      }
    );
  }
}
