// ignore_for_file: deprecated_member_use, unused_local_variable, unused_import, dead_code, unrelated_type_equality_checks, prefer_const_declarations

import 'package:desafio/model/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GastosFields {
  static final List<String> gastos = [
    idGastos,
    item,
    valor,
    parcelas,
    nomeBanco
  ];
  static final String idGastos = '_idGastos';
  static final String item = '_item';
  static final String valor = '_valor';
  static final String parcelas = '_parcelas';
  static final String nomeBanco = '_nomebanco';
}

class Gastos {
  final int? idGastos;
  final String? item;
  final double? valor;
  final int? parcelas;
  final String? nomeBanco;

  Gastos({this.nomeBanco, this.idGastos, this.item, this.valor, this.parcelas});
  Gastos copy({
    int? idGastos,
    String? item,
    double? valor,
    int? parcelas,
    String? nomeBanco,
  }) =>
      Gastos(
          idGastos: idGastos ?? this.idGastos,
          item: item ?? this.item,
          valor: valor ?? this.valor,
          parcelas: parcelas ?? this.parcelas,
          nomeBanco: nomeBanco ?? this.nomeBanco);
  static Gastos fromJson(Map<String, Object?> json) => Gastos(
      idGastos: json[GastosFields.idGastos] as int?,
      item: json[GastosFields.item] as String,
      valor: json[GastosFields.valor] as double,
      parcelas: json[GastosFields.parcelas] as int,
      nomeBanco: json[GastosFields.nomeBanco] as String);

  Map<String, Object?> toJson() => {
        GastosFields.idGastos: idGastos,
        GastosFields.item: item,
        GastosFields.valor: valor,
        GastosFields.parcelas: parcelas,
        GastosFields.nomeBanco: nomeBanco
      };
}
