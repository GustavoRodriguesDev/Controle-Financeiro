// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors

import 'package:desafio/views/Cadastro%20de%20Cartoes/cadastro_cartoes.dart';
import 'package:desafio/views/Cadastro%20de%20gastos/cadastro_gastos.dart';
import 'package:desafio/views/Controle%20de%20gastos/controle_dinheiro.dart';
import 'package:desafio/views/Home%20Page/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: homePage(),
      // Está dizendo qual é a tela que se vai iniciar o app
      routes: {
        // primeira tela do app
        '/cadCartao': (context) => cadCartao(), //Tela de cadastro de cartoes
        '/contFinanceiro': (context) =>
            controleDinheiro(), //tela de controle financeiro
        '/gastos': (context) =>
            Cadastro_Gastos() //tela para cadastro dos gastos
      },
    );
  }
}
