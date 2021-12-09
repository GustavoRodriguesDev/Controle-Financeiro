// ignore_for_file: prefer_const_declarations, avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:desafio/model/card.dart';
import 'package:desafio/model/gastos_controler.dart';
import 'package:desafio/model/parametroNextPage.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ControleGastos {
  static final ControleGastos instace = ControleGastos._init();
  static Database? _database;

  ControleGastos._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('controlegastos.db');
    return _database!;
  }

  Future<Database> _initDB(
    String filePath,
  ) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      final idType = ' INTEGER PRIMARY KEY AUTOINCREMENT';
      final textType = ' TEXT NOT NULL';
      final boolType = ' BOOLEAN NOT NULL';
      final intType = ' INTEGER';
      await db.execute('''
  
      CREATE TABLE Cartao(
        ${CartaoFields.id}$idType,
        ${CartaoFields.nomeBanco}$textType, 
        ${CartaoFields.tipoCartao}$boolType
      );''');
      await db.execute('''
      CREATE TABLE Gastos(
        ${GastosFields.idGastos}$idType,
        ${GastosFields.item}$textType,
        ${GastosFields.valor} REAL NOT NULL,
        ${GastosFields.parcelas} $intType,
        ${GastosFields.nomeBanco} $textType
      );
      ''');
    });
  }

  Future<Cartao> createCartao(Cartao cartao) async {
    final db = await instace.database;

    final id = await db.insert('Cartao', cartao.toJson());
    return cartao.copy(id: id);
  }

  // Future<Cartao> createGastos(Cartao cartao) async {
  //   final db = await instace.database;

  //   final id = await db.insert('Gastos', cartao.toJson());
  //   return cartao.copy(id: id);
  // }
  Future<Cartao> readCartao(int id) async {
    final db = await instace.database;

    final maps = await db.query(
      'Cartao',
      columns: CartaoFields.cartoes,
      where: '${CartaoFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return Cartao.fromJson(maps.first);
    } else {
      throw Exception('ID $id Não Encontrado');
    }
  }

  Future<List<Cartao>> readAllCartoes() async {
    final db = await instace.database;
    final orderBy = '${CartaoFields.id} ASC';
    final result = await db.query('Cartao', orderBy: orderBy);

    return result.map((json) => Cartao.fromJson(json)).toList();
  }

  Future<int> deleteCartao(int id) async {
    final db = await instace.database;

    return await db
        .delete('Cartao', where: '${CartaoFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instace.database;
    db.close();
  }

//---------------------------------------------------------------------------------------------------
  Future<Gastos> createGastos(Gastos gastos) async {
    final db = await instace.database;
    final id = await db.insert('Gastos', gastos.toJson());
    return gastos.copy(idGastos: id);
  }

  Future<Gastos> readGastos(int id) async {
    final db = await instace.database;
    final maps = await db.query(
      'Gastos',
      columns: GastosFields.gastos,
      where: '${GastosFields.idGastos} = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return Gastos.fromJson(maps.first);
    } else {
      throw Exception('id $id Não Encontrado');
    }
  }

  Future<List<Gastos>> readAllGastos() async {
    final db = await instace.database;

    final result = await db.rawQuery(
        'SELECT * FROM Gastos WHERE _nomebanco = "${NextPageCartao.stanceNextPageCartao.nextCard}"');

    return result.map((json) => Gastos.fromJson(json)).toList();
  }

  Future<int> deleteGastos(int id) async {
    final db = await instace.database;
    return await db.delete('Gastos',
        where: '${GastosFields.idGastos} = ?', whereArgs: [id]);
  }
}
