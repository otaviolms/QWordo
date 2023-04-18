import 'package:flutter/foundation.dart';

import 'selecao.dart';

class Partida {

  String letras;
  int tamanhoPartida;
  List<String> linhas = [];
  Map<String, List<int>> palavrasExistentes = {};
  Map<String, List<int>> marcadas = {};
  Selecao? selecaoTemporaria;

  Partida({ required this.letras, required this.palavrasExistentes, this.tamanhoPartida = 6 }) {
    linhas = separarLinhas();
  }

  separarLinhas() {
    List<String> linhas = [];
    for(int i = 0; i < tamanhoPartida; i++) {
      linhas.add(letras.substring(i * tamanhoPartida, (i * tamanhoPartida) + tamanhoPartida));
    }
    return linhas;
  }

  isMarcada(int index) {
    bool isMarcada = false;
    for (var palavra in marcadas.values) { if(palavra.contains(index)) isMarcada = true; }
    return isMarcada;
  }

  isSelecionada(int index) => selecaoTemporaria?.isSelecionada(index) ?? false;
  limparSelecao() => selecaoTemporaria = null;
  isCerta(String palavra) => marcadas.keys.contains(palavra);

  selecionarTemporariamente(int index, bool inicio, Function(String palavra) onAcertou) {
    if(inicio) {
      selecaoTemporaria = Selecao(inicio: index);
    } else {
      selecaoTemporaria?.fim = index;
      selecionarMeio();
      validarSelecao(onAcertou);
    }
  }

  verificarContinuacao(int index) {
    int linhaInicio = indexToX(selecaoTemporaria!.inicio);
    int colunaInicio = indexToY(selecaoTemporaria!.inicio);

    int linhaFim = indexToX(index);
    int colunaFim = indexToY(index);

    return linhaInicio == linhaFim || colunaInicio == colunaFim;
  }

  selecionarMeio() {
    int linhaInicio = indexToX(selecaoTemporaria!.inicio);
    int colunaInicio = indexToY(selecaoTemporaria!.inicio);

    int linhaFim = indexToX(selecaoTemporaria!.fim!);
    int colunaFim = indexToY(selecaoTemporaria!.fim!);

    bool coincidenciaLinha = linhaInicio == linhaFim;

    bool sentidoComum = (coincidenciaLinha) ? (colunaInicio - colunaFim) < 0 : (linhaInicio - linhaFim) < 0;

    List<int> itens = [];
    if(sentidoComum) {
      for(int i = (coincidenciaLinha ? colunaInicio : linhaInicio); i <= (coincidenciaLinha ? colunaFim : linhaFim); i++) {
        itens.add(coincidenciaLinha ? xyToIndex(linhaInicio, i) : xyToIndex(i, colunaInicio));
      }
    } else {
      for(int i = (coincidenciaLinha ? colunaInicio : linhaInicio); i >= (coincidenciaLinha ? colunaFim : linhaFim); i--) {
        itens.add(coincidenciaLinha ? xyToIndex(linhaInicio, i) : xyToIndex(i, colunaInicio));
      }
    }
    selecaoTemporaria!.selecionar(itens);

    print("itens: ${itens}");
  }

  validarSelecao(Function(String palavra) onAcertou) {
    print("Validando seleção");
    for (String palavra in palavrasExistentes.keys) {
      print("Procurando uma palavra igual: ${selecaoTemporaria!.completo} == ${palavrasExistentes[palavra]}");
      if(listEquals(selecaoTemporaria!.completo, palavrasExistentes[palavra])) {
        marcadas[palavra] = palavrasExistentes[palavra]!;
        onAcertou.call(palavra);
        limparSelecao();
        return;
      }
    }
  }

  acertouPalavra(String palavra) => marcadas[palavra] = palavrasExistentes[palavra]!;
  indexToX(int index) => index ~/ tamanhoPartida;
  indexToY(int index) => index % tamanhoPartida;
  xyToIndex(int x, int y) => (x * tamanhoPartida) + y;

}