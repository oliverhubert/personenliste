import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

class Personen {
  final int? id;
  final String name;
  final String adress;
  final String tel;
  final String email;
  final String geb;

  Personen(
      {this.id,
      required this.name,
      required this.adress,
      required this.tel,
      required this.email,
      required this.geb});

  factory Personen.fromMap(Map<String, dynamic> json) => Personen(
        id: json['id'],
        name: json['name'],
        adress: json['adress'],
        tel: json['tel'],
        email: json['email'],
        geb: json['geb'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'adress': adress,
      'tel': tel,
      'email': email,
      'geb': geb,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'personen.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE personen(
        id INTEGER PRIMARY KEY,
        name TEXT,
        adress TEXT,
        tel TEXT,
        email TEXT,
        geb TEXT

      )

   ''');
  }

  Future<List<Personen>> getPersonen() async {
    Database db = await instance.database;
    var personen = await db.query('personen', orderBy: 'name');
    List<Personen> personenList = personen.isNotEmpty
        ? personen.map((c) => Personen.fromMap(c)).toList()
        : [];
    return personenList;
  }

  Future<int> add(Personen personen) async {
    Database db = await instance.database;
    return await db.insert('personen', personen.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('personen', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Personen personen) async {
    Database db = await instance.database;
    return await db.update('personen', personen.toMap(),
        where: 'id = ?', whereArgs: [personen.id]);
  }
}
