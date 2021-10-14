import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'entities/pessoa_entity.dart';
import 'dart:io';
import 'dart:async';

class PessoaDbProvider {

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "artes.db");

    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("""
          CREATE TABLE pessoas(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome VARCHAR NOT NULL,
          cpf VARCHAR NOT NULL,
          senha VARCHAR NOT NULL,
          email VARCHAR NOT NULL )"""
          );
        });
  }

  Future<int> addItem(PessoaEntity item) async {
    final db = await init();
    return db.insert(
      "Pessoas", item.toMap(),
      conflictAlgorithm: ConflictAlgorithm
          .ignore,
    );
  }

  Future<List<PessoaEntity>> fetchPessoas() async {

    final db = await init();
    final maps = await db.query(
        "Pessoas");
    print(maps);
    return List.generate(maps.length, (i) {

      return PessoaEntity(
        maps[i]['id'],
        maps[i]['nome'],
        maps[i]['cpf'],
        maps[i]['senha'],
        maps[i]['email'],
      );
    });
  }

  Future<int> deletePessoa(int ?id) async {
    final db = await init();

    int result = await db.delete(
        "pessoas",
        where: "id = ?",
        whereArgs: [id]
    );

    return result;
  }


  Future<int> updatePessoa(int ?id, PessoaEntity item) async {

    final db = await init();

    int result = await db.update(
        "pessoas",
        item.toMap(),
        where: "id = ?",
        whereArgs: [id]
    );
    return result;
  }
}

