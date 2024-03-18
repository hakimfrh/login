import 'dart:developer';

import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:login/model/user.dart';

class UserDatabase {
  late Database _database;

  Future<void> initializeDatabase() async {
    // // Inisialisasi sqflite dengan sqflite_common_ffi
    // sqfliteFfiInit();
    // // Inisialisasi databaseFactory dengan databaseFactoryFfi
    // databaseFactory = databaseFactoryFfi;

    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, nama TEXT, alamat TEXT, tanggalLahir TEXT, jenisKelamin TEXT, username TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    await _database.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> userMaps = await _database.query('users');
    return List.generate(userMaps.length, (i) {
      return User(
        nama: userMaps[i]['nama'],
        alamat: userMaps[i]['alamat'],
        tanggalLahir: userMaps[i]['tanggalLahir'],
        jenisKelamin: userMaps[i]['jenisKelamin'],
        username: userMaps[i]['username'],
        password: userMaps[i]['password'],
        id: userMaps[i]['id'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    await _database.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    await _database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<User> login(String username, String password) async {
    final List<Map<String, dynamic>> userMaps = await _database.query('users',
        where: 'username = ? AND password = ?',
        whereArgs: [username, password]);

    if (userMaps.isNotEmpty) {
      return User(
        id: userMaps[0]['id'],
        nama: userMaps[0]['nama'],
        alamat: userMaps[0]['alamat'],
        tanggalLahir: userMaps[0]['tanggalLahir'],
        jenisKelamin: userMaps[0]['jenisKelamin'],
        username: userMaps[0]['username'],
        password: userMaps[0]['password'],
      );
    } else {
      return User(
          nama: "",
          alamat: "",
          tanggalLahir: "",
          jenisKelamin: "",
          username: "",
          password: "");
    }
  }

  Future<String> register(User user) async {
    final List<Map<String, dynamic>> userMaps = await _database
        .query('users', where: 'username = ?', whereArgs: [user.username]);

    if (userMaps.isEmpty) {
      await _database.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return "1-success";
    } else {
      return "0-already exist";
    }
  }
}
