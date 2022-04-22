import 'package:flutter/material.dart';
import 'package:lista_compras/models/item_compra.dart';

class AppController extends ChangeNotifier {
  static final AppController _instance = AppController._internal();

  var titlePage = ValueNotifier<String>('');
  var subTitlePage = ValueNotifier<String>('');
  var dataLista = ValueNotifier<String>('');

  var indexPage = ValueNotifier(0);
  var listaItensCompra = ValueNotifier<List<ItemCompra>>([]);

  factory AppController() {
    return _instance;
  }

  AppController._internal();

  setTitlePage(String title) {
    titlePage.value = title;
    notifyListeners();
  }

  setDataLista(String data) {
    dataLista.value = data;
    notifyListeners();
  }

  setSubTitlePage(String subtitle) {
    subTitlePage.value = '$subtitle  ${dataLista.value}';
    notifyListeners();
  }

  setIndexPage(int index) {
    indexPage.value = index;
    notifyListeners();
  }

  setListaItensCompra(List<ItemCompra> itensCompra) {
    listaItensCompra.value = itensCompra;
    notifyListeners();
  }
}
