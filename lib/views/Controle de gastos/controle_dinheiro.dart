// ignore_for_file: camel_case_types, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_this, prefer_initializing_formals, unnecessary_string_interpolations, type_init_formals, unused_import, must_call_super, override_on_non_overriding_member, non_constant_identifier_names, annotate_overrides, avoid_print, file_names

import 'package:desafio/model/card.dart';
import 'package:desafio/model/gastos_controler.dart';
import 'package:desafio/model/parametroNextPage.dart';
import 'package:desafio/repositories/controlegastos_database.dart';
import 'package:desafio/widgets/card_gastos.dart';
import 'package:flutter/material.dart';

class controleDinheiro extends StatefulWidget {
  const controleDinheiro({Key? key}) : super(key: key);

  @override
  _controleDinheiroState createState() => _controleDinheiroState();
}

class _controleDinheiroState extends State<controleDinheiro> {
  var gastos = [];
  @override
  void initState() {
    getGastos();
    super.initState();
  }

  void getGastos() async {
    gastos = await ControleGastos.instace.readAllCartoes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        title: Text(NextPageCartao.stanceNextPageCartao.nextCard!),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 30,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Item'),
                    Text('Valor'),
                    Text('Parcelas'),
                  ],
                ),
              ),
            ),
            FutureBuilder<List<Gastos>>(
              future: ControleGastos.instace.readAllGastos(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return MeuCardGastos(
                            gastos: snapshot.data![index],
                          );
                        }),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/gastos');
        },
      ),
    );
  }
}
