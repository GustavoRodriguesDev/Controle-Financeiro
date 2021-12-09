// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables, annotate_overrides, unnecessary_string_interpolations

import 'package:desafio/model/gastos_controler.dart';
import 'package:desafio/repositories/controlegastos_database.dart';
import 'package:flutter/material.dart';

class MeuCardGastos extends StatefulWidget {
  final Gastos gastos;
  const MeuCardGastos({required this.gastos});

  @override
  _MeuCardGastosState createState() => _MeuCardGastosState();
}

class _MeuCardGastosState extends State<MeuCardGastos> {
  late final ControleGastos controleGastos;

  @override
  void initState() {
    controleGastos = ControleGastos.instace;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: InkWell(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: Center(child: Text('${widget.gastos.item!}')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: Text('      R\$ ${widget.gastos.valor}'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Text('      x ${widget.gastos.parcelas}'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
