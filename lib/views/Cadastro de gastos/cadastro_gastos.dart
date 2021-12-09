// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, unused_local_variable, await_only_futures, avoid_print

import 'package:desafio/model/gastos_controler.dart';
import 'package:desafio/model/parametroNextPage.dart';

import 'package:desafio/repositories/controlegastos_database.dart';
import 'package:flutter/material.dart';

class Cadastro_Gastos extends StatefulWidget {
  final Gastos? gastos;
  const Cadastro_Gastos({Key? key, this.gastos}) : super(key: key);

  @override
  _Cadastro_GastosState createState() => _Cadastro_GastosState();
}

class _Cadastro_GastosState extends State<Cadastro_Gastos> {
  late String? item;
  late double? valor;
  late int? parcelas;
  @override
  void initState() {
    super.initState();
    item = widget.gastos?.item ?? '';
    valor = widget.gastos?.valor;
    parcelas = widget.gastos?.parcelas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/contFinanceiro');
          },
        ),
        title: Text('Adicionar Gastos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  item = value;
                },
                decoration: InputDecoration(
                    label: Text('Item Compradro'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              Container(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  valor = double.tryParse(value);
                },
                decoration: InputDecoration(
                    label: Text('Valor do Item'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all((Radius.circular(20))))),
              ),
              Container(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  parcelas = int.tryParse(value);
                },
                decoration: InputDecoration(
                    label: Text('Quantas parcelas'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              Container(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    String nomeBanco =
                        NextPageCartao.stanceNextPageCartao.nextCard!;
                    final gastos = Gastos(
                        item: item,
                        valor: valor,
                        parcelas: parcelas,
                        nomeBanco: nomeBanco);
                    await ControleGastos.instace.createGastos(gastos);
                    Navigator.of(context)
                        .pushReplacementNamed('/contFinanceiro');
                  },
                  child: Text('Cadastrar Gastos'))
            ],
          ),
        ),
      ),
    );
  }
}
