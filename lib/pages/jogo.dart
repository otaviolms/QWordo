import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwordo/components/stats.dart';
import 'package:qwordo/models/partida.dart';

import '../components/grade.dart';
import '../repository/jogos_repository.dart';

class JogoPage extends StatefulWidget {
  int nivel;
  late Partida partida;

  JogoPage({Key? key, required this.nivel}) : super(key: key);

  @override
  State<JogoPage> createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  late JogosRepository jogosRepository;

  List<Widget> _montarListaPalavras() {
    List<Widget> lista = [];
    for(String palavra in widget.partida.palavrasExistentes.keys) {
      lista.add(
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: widget.partida.isCerta(palavra) ? Color(0xffa38bfe) : Color(0xff10111a),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                child: Text(palavra, style: TextStyle(color: Color(0xffe2e1f5))),
              ),
            ),
          )
      );
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    jogosRepository = context.watch<JogosRepository>();
    widget.partida = jogosRepository.partidas[widget.nivel];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: null,
        title: const Text("Qwordo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stats(titulo: "Palavras", valor: "${widget.partida.marcadas.keys.length} - ${widget.partida.palavrasExistentes.keys.length}"),
              Stats(titulo: "Tempo", valor: "05:12"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: _montarListaPalavras()
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Grade(
                partida: widget.partida,
                onAcertou: (palavra) {
                  widget.partida.acertouPalavra(palavra);
                  jogosRepository.salvarPartida(widget.nivel, widget.partida);
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}
