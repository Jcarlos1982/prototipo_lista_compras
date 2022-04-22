import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/models/item_lista_compra.dart';

class CadastroItemLista extends StatefulWidget {
  final ItemListaCompra? lista;
  const CadastroItemLista({Key? key, this.lista}) : super(key: key);

  @override
  State<CadastroItemLista> createState() => _CadastroItemListaState();
}

class _CadastroItemListaState extends State<CadastroItemLista> {
  var tituloController = TextEditingController();
  var descricaoController = TextEditingController();
  var dataController = TextEditingController();
  var itensController = TextEditingController();

  @override
  void initState() {
    super.initState();

    tituloController.text = widget.lista?.titulo ?? '';
    descricaoController.text = widget.lista?.descricao ?? '';
    dataController.text = formatDate(
        widget.lista?.data ?? DateTime.now(), [dd, '/', mm, '/', yyyy]);
    itensController.text =
        widget.lista?.listaItensCompra.length.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cadastro Lista'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: tituloController,
                decoration: InputDecoration(label: Text('Título')),
              ),
              TextField(
                controller: descricaoController,
                decoration: InputDecoration(label: Text('Descrição')),
              ),
              TextField(
                controller: dataController,
                decoration: InputDecoration(label: Text('Data')),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Salvar')),
            ],
          ),
        ));
  }
}
