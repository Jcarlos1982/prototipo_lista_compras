class ItemCompra {
  final String titulo;
  final String descricao;
  final String linkImagem;
  final bool concluido;

  ItemCompra(
      {required this.titulo,
      required this.descricao,
      required this.linkImagem,
      this.concluido = false});
}
