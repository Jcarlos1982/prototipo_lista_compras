import 'package:flutter/material.dart';
import 'package:lista_compras/models/item_compra.dart';

class CadastroItemCompra extends StatefulWidget {
  final ItemCompra? item;
  const CadastroItemCompra({Key? key, this.item}) : super(key: key);

  @override
  State<CadastroItemCompra> createState() => _CadastroItemCompraState();
}

class _CadastroItemCompraState extends State<CadastroItemCompra> {
  var tituloController = TextEditingController();
  var descricaoController = TextEditingController();
  var linkImagemController = TextEditingController();

  @override
  void initState() {
    super.initState();

    tituloController.text = widget.item?.titulo ?? '';
    descricaoController.text = widget.item?.descricao ?? '';
    linkImagemController.text = widget.item?.linkImagem ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cadastro Item'),
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
                controller: linkImagemController,
                decoration: InputDecoration(label: Text('Link Imagem')),
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
