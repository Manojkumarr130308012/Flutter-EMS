import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._internal();


  static Database? _database;

  DBHelper._internal();



  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'test.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }


  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE test (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workorder TEXT,
        hours TEXT,
        minutes TEXT,
        seconds TEXT
      )
    ''');
  }

  Future<int> insertTime(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('test', row);
  }

  Future<List<Map<String, dynamic>>> getTimes() async {
    final dbClient = await instance.database;
    return await dbClient!.query('test');
  }

  Future<int> updateTime(int id, String WorkOrderId, String hours, String minutes, String seconds) async {
    final dbClient = await instance.database;
    return await dbClient!.update('test', {'workorder': WorkOrderId, 'hours': hours, 'minutes': minutes, 'seconds': seconds}, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTime(int id) async {
    final dbClient = await instance.database;
    return await dbClient!.delete('test', where: 'id = ?', whereArgs: [id]);
  }


  Future<Map<String, dynamic>?> getTimeById(String id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('test', where: 'workorder = ?', whereArgs: [id]);
    return maps.isNotEmpty ? maps.first : null;
  }

  Future close() async {
    final dbClient = await _database;
    dbClient!.close();
  }
}
