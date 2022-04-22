import 'package:lista_compras/models/item_compra.dart';

class ItemListaCompra {
  final String titulo;
  final String descricao;
  final DateTime data;
  final List<ItemCompra> listaItensCompra;

  ItemListaCompra(
      {required this.titulo,
      required this.descricao,
      required this.data,
      this.listaItensCompra = const <ItemCompra>[]});
}
