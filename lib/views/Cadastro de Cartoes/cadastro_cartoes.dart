// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_import, must_be_immutable, avoid_print, override_on_non_overriding_member, annotate_overrides, unused_local_variable, dead_code, unused_element, unnecessary_null_comparison, unnecessary_import

import 'package:desafio/repositories/controlegastos_database.dart';
import 'package:flutter/material.dart';
import 'package:desafio/model/card.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class cadCartao extends StatefulWidget {
  final Cartao? cartao;
  const cadCartao({Key? key, this.cartao}) : super(key: key);

  @override
  _cadCartaoState createState() => _cadCartaoState();
}

class _cadCartaoState extends State<cadCartao> {
  late bool? tipoCartao;
  late String nomeBanco;

  @override
  void initState() {
    super.initState();
    tipoCartao = widget.cartao?.tipoCartao ?? false;
    nomeBanco = widget.cartao?.nomebanco ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        title: Text('Cadastro Cartão'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextField(
                  onChanged: (text) {
                    nomeBanco = text;
                  },
                  decoration: InputDecoration(
                      labelText: 'Nome do Banco',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                Container(
                  height: 10,
                ),
                CheckboxListTile(
                    value: tipoCartao,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Vais ser cartão de credito ?'),
                        Text('Sim')
                      ],
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        tipoCartao = value;
                        print(tipoCartao);
                      });
                    }),
                RaisedButton(
                  onPressed: () async {
                    final cartao =
                        Cartao(nomebanco: nomeBanco, tipoCartao: true);
                    await ControleGastos.instace.createCartao(cartao);
                    Navigator.of(context).popAndPushNamed('/');
                    //ControleGastos.instace.readAllCartoes();
                  },
                  child: Container(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
