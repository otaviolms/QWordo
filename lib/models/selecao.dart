class Selecao {
  int inicio;
  int? fim;
  List<int> completo;

  Selecao({ required this.inicio, this.fim, this.completo = const [] });

  isSelecionada(int index) => index == inicio || index == fim || completo.contains(index);
  selecionar(List<int> itens) => completo = itens;
}