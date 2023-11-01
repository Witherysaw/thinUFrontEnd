import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{


  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE articles(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    poster TEXT,
    title TEXT,
    content TEXT,
    img BLOB,
    liked TEXT DEFAULT "FALSE",
    saved TEXT DEFAULT "FALSE",
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
  """);

  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'thinu.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }
  // Create new item (journal)
  static Future<int> createItem(String poster, String title, String description, Uint8List? img) async {
    final db = await SQLHelper.db();

    final data = {
      'poster': poster,
      'title': title,
      'content': description,
      'img': img,  // Store the selected image as a BLOB
    };

    final id = await db.insert('articles', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }


  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('articles', orderBy: "id DESC");
  }

  // Read saved items
  static Future<List<Map<String, dynamic>>> getSavedArticles() async {
    final db = await SQLHelper.db();
    return db.query('articles', where: "saved = ?", whereArgs: ["TRUE"], orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('articles', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateLike(
      int id, String liked) async {
    final db = await SQLHelper.db();

    final data = {
      'liked': liked,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('articles', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<int> updateSaved(
      int id, String saved) async {
    final db = await SQLHelper.db();

    final data = {
      'saved': saved,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('articles', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String poster, String title, String? description, Uint8List? img) async {
    final db = await SQLHelper.db();


    final data = {
      'poster': poster,
      'title': title,
      'content': description,
      'img': img,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('articles', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("articles", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}

