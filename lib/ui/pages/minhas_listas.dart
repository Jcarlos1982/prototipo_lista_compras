import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/app_controller.dart';
import 'package:lista_compras/models/item_lista_compra.dart';
import 'package:lista_compras/ui/pages/cadastro_lista.dart';

class MinhasListasPage extends StatefulWidget {
  final String tittle;
  final List<ItemListaCompra> listasCompra;
  const MinhasListasPage({
    Key? key,
    this.tittle = 'MinhasListas',
    required this.listasCompra,
  }) : super(key: key);

  @override
  State<MinhasListasPage> createState() => _MinhasListasPageState();
}

class _MinhasListasPageState extends State<MinhasListasPage> {
  final AppController appController = AppController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(widget.tittle),
          ],
        ),
      ),
      body: widget.listasCompra.isEmpty
          ? Center(
              child: Text('Não há listas'),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: widget.listasCompra.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(' ${widget.listasCompra[index].titulo}'),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    formatDate(widget.listasCompra[index].data,
                                        [dd, '/', mm, '/', yyyy]),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    '${widget.listasCompra[index].listaItensCompra.length.toString()} itens',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          ]),
                      subtitle: Text(widget.listasCompra[index].descricao),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroItemLista(
                                  lista: ItemListaCompra(
                                    titulo: 'item $index',
                                    descricao: 'Descrição item $index',
                                    data: DateTime.now(),
                                  ),
                                ),
                              ));
                        },
                      ),
                      onTap: () {
                        appController.setListaItensCompra(
                            widget.listasCompra[index].listaItensCompra);
                        appController
                            .setTitlePage(widget.listasCompra[index].titulo);
                        appController.setDataLista(' - ' +
                            formatDate(widget.listasCompra[index].data,
                                [dd, '/', mm, '/', yyyy]));
                        appController.setSubTitlePage(
                            widget.listasCompra[index].descricao);

                        appController.setIndexPage(0);
                      },
                    ),
                    const Divider()
                  ],
                );
              }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          heroTag: 'cadLista',
          backgroundColor: Colors.green[100],
          child: Icon(
            Icons.add,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroItemLista(),
                ));
          }),
    );
  }
}
