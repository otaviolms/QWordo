import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qwordo/components/botao_grande.dart';
import 'package:qwordo/components/grade_miniatura.dart';
import 'package:qwordo/components/stats.dart';
import 'package:qwordo/pages/jogo.dart';

import '../repository/jogos_repository.dart';

class InicioPage extends StatefulWidget {
  int paginaAtual = 0;

  InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  late JogosRepository jogosRepository;

  voltarPagina() { if(widget.paginaAtual > 0) widget.paginaAtual--; }
  avancarPagina() { if(widget.paginaAtual < (jogosRepository.partidas.length - 1)) widget.paginaAtual++; }

  abrirJogo(BuildContext context, int nivel) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => JogoPage(nivel: nivel)));
  }

  @override
  Widget build(BuildContext context) {
    jogosRepository = context.watch<JogosRepository>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: null,
        leading: IconButton(icon: const FaIcon(FontAwesomeIcons.sliders), onPressed: () {  }),
        title: const Text("Qwordo"),
        actions: [
          IconButton(icon: const FaIcon(FontAwesomeIcons.chartPie), onPressed: () {  })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Today", style: TextStyle(color: Color(0xffe2e1f5))),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       child: SizedBox(width: 6, height: 6, child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffe2e1f5)))),
          //     ),
          //     Text("Oct 20", style: TextStyle(color: Color(0xffe2e1f5))),
          //   ],
          // ),
          Text("Nível ${widget.paginaAtual + 1}", style: const TextStyle(fontSize: 30, color: Color(0xffe2e1f5))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () { setState(() { voltarPagina(); }); }, icon: const FaIcon(FontAwesomeIcons.chevronLeft)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
                child: SizedBox(
                  width: 240,
                  height: 240,
                  child: GradeMiniatura(partida: jogosRepository.partidas[widget.paginaAtual]),
                ),
              ),
              IconButton(onPressed: () { setState(() { avancarPagina(); }); }, icon: const FaIcon(FontAwesomeIcons.chevronRight)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stats(titulo: "Palavras", valor: "0 - 32"),
              Stats(titulo: "Tempo", valor: "20:32"),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BotaoGrande(cor: const Color(0xfff4937d), texto: "Pontuação", icone: FontAwesomeIcons.chartPie, onTap: () => { abrirJogo(context, widget.paginaAtual) }),
                BotaoGrande(cor: const Color(0xffa38bfe), texto: "Jogar agora", icone: FontAwesomeIcons.play, onTap: () => { abrirJogo(context, widget.paginaAtual) }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
