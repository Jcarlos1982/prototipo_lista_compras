import 'package:lista_compras/models/item_compra.dart';
import '../models/item_lista_compra.dart';

List<ItemCompra> gerarListaItems(int quantidade) {
  List<ItemCompra> listaItensCompra = <ItemCompra>[];

  for (var i = 0; i < quantidade; i++) {
    var index = i + 1;
    listaItensCompra.add(
      ItemCompra(
          titulo: 'Título do item $index',
          descricao: 'Descrição do item $index',
          linkImagem: 'www.imagem$index.com.br'),
    );
  }

  return listaItensCompra;
}

List<ItemListaCompra> gerarListasCompra(int listas, int itens) {
  List<ItemListaCompra> listasCompra = <ItemListaCompra>[];

  for (var i = 1; i < listas; i++) {
    var index = i + 1;
    listasCompra.add(
      ItemListaCompra(
          titulo: 'Lista de Compras $index',
          descricao: 'Descrição  da lista de compras $index',
          data: DateTime.now(),
          listaItensCompra: gerarListaItems(itens)),
    );
  }
  return listasCompra;
}
