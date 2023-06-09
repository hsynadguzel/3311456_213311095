// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:e_commerce/model/shopping_cart_model.dart';

class DbHelper {
  Database? _db;
  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database?> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), 'scart.db');
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        'Create table carts(id integer primary key, name text, description text, photo text, unitPrice  integer)');
  }

  // oluşturulan veritabanındaki verilerin tamamını listelemek için
  Future<List<Cart>> getProducts() async {
    Database? db = await this.db;
    var result = await db?.query("carts");
    return List.generate(result!.length, (index) {
      return Cart.fromObject(result[index]);
    });
  }

  Future<int?> insert(Cart cart) async {
    Database? db = await this.db;
    var result = await db?.insert("carts", cart.toMap());
  }

  Future<int?> delete(int id) async {
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from carts where id = $id");
    return result;
  }

  Future<int?> updata(Cart product) async {
    Database? db = await this.db;
    var result = await db?.update("carts", product.toMap(),
        where: "id=?", whereArgs: [product.id]);
    return result;
  }
}
