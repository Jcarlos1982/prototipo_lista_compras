import 'package:flutter/material.dart';
import 'package:lista_compras/app_controller.dart';
import 'package:lista_compras/models/item_compra.dart';
import 'package:lista_compras/ui/pages/cadastro_item.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  AppController appController = AppController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(appController.titlePage.value),
            Text(
              appController.subTitlePage.value,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: appController.listaItensCompra.value.isEmpty
          ? Center(
              child: Text('Não há itens'),
            )
          : ValueListenableBuilder<List<ItemCompra>>(
              valueListenable: appController.listaItensCompra,
              builder: (BuildContext context, value, Widget? child) =>
                  ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: appController.listaItensCompra.value.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(appController
                                  .listaItensCompra.value[index].titulo),
                              subtitle: Text(appController
                                  .listaItensCompra.value[index].descricao),
                              leading: const Icon(
                                Icons.photo,
                                size: 50,
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CadastroItemCompra(
                                        item: appController
                                            .listaItensCompra.value[index],
                                      ),
                                    ));
                              },
                            ),
                            const Divider(
                              height: 2,
                            )
                          ],
                        );
                      }),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          heroTag: 'cadItem',
          backgroundColor: Colors.green[100],
          child: Icon(
            Icons.add,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroItemCompra(),
                ));
          }),
    );
  }
}
