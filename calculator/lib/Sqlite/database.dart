import 'dart:io';
import 'dart:async';
import 'package:calculator/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  DBProvider.createInstance();
  static final db = DBProvider.createInstance();//singleton

  Database _database;

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }

    _database = await initDB();
    
    return _database;
  }
  initDB() async{
    
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path + 'calculator8.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await  db.execute("CREATE TABLE User("
        "id INTEGER PRIMARY KEY,"
        "description TEXT,"
        "date TEXT"
        ")");
      },
    );
  }

  //CRUD
  //Create
    newUser(User newUser) async{
    final db = await database;

    var table = await db.rawQuery('SELECT MAX(id)+1 as id FROM User');
    int id = table.first['id'];

    var raw = await db.rawInsert('INSERT Into User(id,description,date)'
    'VALUES (?,?,?)',
    [id, newUser.description, newUser.date]);

    return raw;
  }
  //Read
  getUser(int id) async{
    final db = await database;
    
    var result = await db.query('User', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty? User.fromMap(result.first) : null;
  }
  Future<List<User>> getAllUsers() async{
    final db = await database;

    var result = await db.query('User');

    List<User> list = result.isNotEmpty? result.map((element) => User.fromMap(element)).toList() : [];
    debugPrint('Length: ${list.length}');
    return list;
  }
  //update
  updateUser(User user) async{
    final db = await database;

    var result = await db.update('User', user.toMap(), where: 'id = ?', whereArgs: [user.id]);

    return result;
  }

  //delete
  deleteUser(int id) async{
    final db = await database;

    db.delete('User', where: 'id: ?', whereArgs: [id]);
  }
  deleteAll() async{
    final db = await database;
    db.rawDelete('Delete * from Client');
  }
}