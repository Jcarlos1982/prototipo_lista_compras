import 'package:flutter/material.dart';
import 'package:lista_compras/app_controller.dart';
import 'package:lista_compras/models/item_compra.dart';
import 'package:lista_compras/repositories/repository_mock.dart';
import 'package:lista_compras/ui/pages/lista.dart';
import 'package:lista_compras/ui/pages/minhas_listas.dart';
import 'package:lista_compras/ui/widgets/bottom_item.dart';

class Home extends StatefulWidget {
  final String tittle;
  const Home({Key? key, this.tittle = 'Home'}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppController appController = AppController();
  String subtitleLista = 'Supermercado 24/04/2022';

  @override
  void initState() {
    super.initState();
    appController.setListaItensCompra(gerarListaItems(15));
    appController.setTitlePage(appController.listaItensCompra.value[0].titulo);
    appController
        .setSubTitlePage(appController.listaItensCompra.value[0].descricao);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ItemCompra>>(
        valueListenable: appController.listaItensCompra,
        builder: (BuildContext context, value, Widget? child) => Scaffold(
            body: IndexedStack(
              index: appController.indexPage.value,
              children: [
                ListaPage(),
                MinhasListasPage(
                  tittle: 'Minhas Listas de Compra',
                  listasCompra: gerarListasCompra(10, 20),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomItemWidget(
                      selected: appController.indexPage.value == 0,
                      title: 'Lista',
                      icon: Icon(Icons.list_alt),
                      onTap: () {
                        setState(() {
                          appController.setIndexPage(0);
                        });
                      },
                    ),
                    BottomItemWidget(
                        selected: appController.indexPage.value == 1,
                        title: 'Minhas Listas',
                        icon: Icon(Icons.list),
                        onTap: () {
                          setState(() {
                            appController.setIndexPage(1);
                          });
                        }),
                  ],
                ),
              ),
            )));
  }
}
