// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, annotate_overrides, unused_element
import 'package:desafio/model/card.dart';
import 'package:desafio/model/parametroNextPage.dart';
import 'package:desafio/repositories/controlegastos_database.dart';
import 'package:flutter/material.dart';

class MeuCard extends StatefulWidget {
  final Cartao cartao;
  final VoidCallback ontap;
  const MeuCard({
    Key? key,
    required this.ontap,
    required this.cartao,
  }) : super(key: key);

  @override
  _MeuCardState createState() => _MeuCardState();
}

class _MeuCardState extends State<MeuCard> {
  late final ControleGastos controleGastos;
  String? nextNomebanco;

  @override
  void initState() {
    controleGastos = ControleGastos.instace;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: InkWell(
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    widget.cartao.nomebanco!,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      child: Icon(Icons.delete),
                      onPressed: () {
                        ControleGastos.instace.deleteCartao(widget.cartao.id!);
                      }),
                ),
                ListTile(
                  title: Text(
                      widget.cartao.tipoCartao == false ? "Saldo" : "Fatura"),
                )
              ],
            ),
          ),
          onTap: () {
            NextPageCartao.stanceNextPageCartao.nextCard =
                widget.cartao.nomebanco;

            Navigator.of(context).pushReplacementNamed(
              '/contFinanceiro',
            );
          }),
    );
  }
}
