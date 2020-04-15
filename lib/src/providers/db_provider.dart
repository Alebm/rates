
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:rates/src/models/prest_model.dart';
export 'package:rates/src/models/prest_model.dart';

class DBProvider{
  static Database _database;
  static final DBProvider db = DBProvider._private();

  DBProvider._private(); // se puede dejar solo el guion bajo es comun verlo

  Future<Database>get database async {

    if (_database != null) return _database;

    _database = await initDB();

    return _database;
    
  }

initDB() async{

  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  final path = join(documentsDirectory.path, 'PrestDB.db' );

  return await openDatabase(
    path,
    version: 1,
    onOpen: (db){},
    onCreate: (Database db, int version)async {
      await db.execute(
        'CREATE TABLE Prest('
         'id INTEGER PRIMARY KEY,'
         'tipo TEXT,'
         'valor TEXT'
        ')'
      );
    }
  );
}

// crear registros
nuevoPrest( PrestModel nuevoPrest) async {

  final db = await database;
  final res = await db.insert('Prest', nuevoPrest.toJson());
  return res;

}

// SELECT - Obtener informacion
  Future<PrestModel> getPrestId (int id) async{

    final db  = await database;
    final res = await db.query('Prest', where: 'id= ?', whereArgs: [id]);
    return res.isNotEmpty ? PrestModel.fromJson(res.first) : null;

  }
  
  Future<List<PrestModel>> getTodosPrest() async{

    final db  = await database;
    final res = await db.query('Prest');

    List<PrestModel> list = res.isNotEmpty 
                                    ? res.map((c)=>PrestModel.fromJson(c)).toList()
                                    :[];
    return list;

  }

  //Actualizar registos
  Future<int> updatePrest( PrestModel nuevoPrest ) async{

    final db  = await database;
    final res = await db.update('Prest', nuevoPrest.toJson(), where: 'id = ?', whereArgs: [nuevoPrest.id]);
    return res;
  }

  //Eliminar registros

  Future<int> deletePrest(int id) async{

    final db  = await database;
    final res = await db.delete('Prest', where: 'id = ?', whereArgs: [id]);
    return res;
  }
  //Eliminar todo 
    Future<int> deleteAll() async{

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM Prest');
    return res;
  }

}