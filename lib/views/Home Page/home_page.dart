// ignore_for_file: camel_case_types, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_this, prefer_initializing_formals, unnecessary_string_interpolations, type_init_formals, unused_import, must_call_super, override_on_non_overriding_member, non_constant_identifier_names, annotate_overrides, avoid_print, deprecated_member_use, unused_label

import 'dart:async';
import 'package:desafio/model/card.dart';
import 'package:desafio/repositories/controlegastos_database.dart';
import 'package:desafio/widgets/card_home.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var cartoes = [];
  @override
  void initState() {
    getCartoes();
    super.initState();
  }

  getCartoes() async {
    cartoes = await ControleGastos.instace.readAllCartoes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Financeiro'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          FutureBuilder<List<Cartao>>(
              future: ControleGastos.instace.readAllCartoes(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                } else {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.87,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (contex, index) {
                            return MeuCard(
                              cartao: snapshot.data![index],
                              ontap: () {
                                setState(() {});
                              },
                            );
                          }));
                }
              })
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(
            '/cadCartao',
          );
        },
      ),
    );
  }
}
