import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:qwordo/models/partida.dart';

class JogosRepository extends ChangeNotifier {

  final List<Partida> _partidas = [
    Partida(
      letras: "ASJSBETOLAJDVBENOOMRNTLSHESOHDLOJAOH",
      palavrasExistentes: {
        "SANTO": [3, 9, 15, 21, 27],
        "SOBRE": [1, 7, 13, 19, 25],
        "OLÁ": [7, 8, 9],
        "OLHO": [16, 22, 28, 34],
        "LOJA": [30, 31, 32, 33]
      }
    ),
    Partida(
      letras: "SABADOTVULTOCKMGOUASNIELMMJOGOAFJOGS",
      palavrasExistentes: {
        "SABADO": [0, 1, 2, 3, 4, 5],
        "CAMA": [12, 18, 24, 30],
        "OCULOS": [5, 11, 17, 23, 29, 35],
        "VULTO": [7, 8, 9, 10, 11],
        "JOGO": [26, 27, 28, 29]
      }
    ),
    Partida(
      letras: "ESJSBESFIOROEKMGODMSNIERWMLFDGLFJAOH",
      palavrasExistentes: {
        "COELHO": [3, 9, 15, 21, 27],
        "ABELHA": [1, 7, 13, 19, 25],
        "SABOR": [7, 8, 9],
        "LIMAO": [16, 22, 28, 34],
        "LOJA": [30, 31, 32, 33]
      }
    ),
    Partida(
      letras: "ISJSBESFIOROEKMGODMSNIERWMLFDGLFJAOH",
      palavrasExistentes: {
        "ESPETO": [3, 9, 15, 21, 27],
        "SABAO": [1, 7, 13, 19, 25],
        "FRUTA": [7, 8, 9],
        "OLHO": [16, 22, 28, 34],
        "LOJA": [30, 31, 32, 33]
      }
    ),
    Partida(
      letras: "USJSBESFIOROEKMGODMSNIERWMLFDGLFJAOH",
      palavrasExistentes: {
        "JANTAR": [3, 9, 15, 21, 27],
        "SOBRE": [1, 7, 13, 19, 25],
        "OLÁ": [7, 8, 9],
        "OLHO": [16, 22, 28, 34],
        "LOJA": [30, 31, 32, 33]
      }
    ),
  ];

  UnmodifiableListView<Partida> get partidas => UnmodifiableListView(_partidas);

  salvarPartida(int nivel, Partida partida) {
    _partidas[nivel] = partida;
    notifyListeners();
  }

}