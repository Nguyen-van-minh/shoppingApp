import 'package:injectable/injectable.dart';
import 'package:shopping_cart/src/extras/models/cart/cart.view.model.dart';
import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@Injectable()
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'shopping_cart.db');
    _database = await openDatabase(path, version: 1);
    bool tableExists = await database.then((db) async {
      var res = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='product'");
      return res.isNotEmpty;
    });
    if (!tableExists) {
      await _createDb(_database!, 1);
      await _insertInitialData(_database!);
    } else {
      int? count = Sqflite.firstIntValue(
          await _database!.rawQuery('SELECT COUNT(*) FROM product'));
      if (count == 0) {
        await _insertInitialData(_database!);
      }
    }
    return _database!;
  }

  // Future<Database> initDatabase() async {
  //   String path = join(await getDatabasesPath(), 'shopping_cart.db');
  //   return await openDatabase(path, version: 1, onCreate: _createDb);
  // }
  Future<void> deleteAllProducts() async {
    Database db = await _instance.database;
    await db.delete('product');
  }

  Future<void> deleteAllCarts() async {
    Database db = await _instance.database;
    await db.delete('cart');
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product (
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
        price REAL,
        isHot INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY,
        productId INTEGER,
        quantity INTEGER,
        FOREIGN KEY (productId) REFERENCES product(id)
      )
    ''');
  }

  Future<int> insertProduct(Map<String, dynamic> row) async {
    Database db = await _instance.database;
    return await db.insert('product', row);
  }

  Future<List<Map<String, dynamic>>> queryAllProducts() async {
    Database db = await _instance.database;
    return await db.query('product');
  }

  Future<List<ProductVieModel>> getAllProducts({int isHot = 0}) async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> results =
        await db.query('product', where: 'isHot = ?', whereArgs: [isHot]);
    return results
        .map((productMap) => ProductVieModel.fromMap(productMap))
        .toList();
  }

  Future<ProductVieModel?> getProductById(int id) async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> results = await db.query(
      'product',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return ProductVieModel.fromMap(results.first);
    } else {
      return null;
    }
  }

  Future<int> updateProduct(Map<String, dynamic> row) async {
    Database db = await _instance.database;
    int id = row['id'];
    return await db.update('product', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteProduct(int id) async {
    Database db = await _instance.database;
    return await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> addToCart(Map<String, dynamic> row) async {
    Database db = await _instance.database;
    return await db.insert('cart', row);
  }

  Future<List<Map<String, dynamic>>> queryAllCartItems() async {
    Database db = await _instance.database;
    return await db.query('cart');
  }

  Future<List<CartViewModel>> getAllCarts() async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> results = await db.query('cart');

    return results
        .map((productMap) => CartViewModel.fromMap(productMap))
        .toList();
  }

  Future<int> removeFromCart(int id) async {
    Database db = await _instance.database;
    return await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateCartItem(Map<String, dynamic> row) async {
    Database db = await _instance.database;
    int id = row['id'];
    return await db.update('cart', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> _insertInitialData(Database db) async {
    final List<ProductVieModel> products = [
      ProductVieModel(
          name: "name 1", image: "product_0.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 2", image: "product_1.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 3", image: "product_2.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 4", image: "product_3.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 5", image: "product_4.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 6", image: "product_4.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 7", image: "product_5.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 8", image: "product_6.jpg", price: 150000, isHot: 1),
      ProductVieModel(
          name: "name 9", image: "product_7.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 10", image: "product_8.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 11", image: "product_9.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 12", image: "product_0.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 13", image: "product_1.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 14", image: "product_2.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 15", image: "product_3.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 16", image: "product_4.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 17", image: "product_4.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 18", image: "product_5.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 19", image: "product_6.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 20", image: "product_7.jpg", price: 150000, isHot: 0),
      ProductVieModel(
          name: "name 21", image: "product_8.jpg", price: 150000, isHot: 0),
      ProductVieModel(
        name: "name 22",
        image: "product_9.jpg",
        price: 150000,
        isHot: 0,
      )
      // Add more products as needed
    ];
    for (var product in products) {
      await db.insert('product', {
        'name': product.name,
        'image': product.image,
        'price': product.price,
        'isHot': product
            .isHot, // Đây là giá trị mặc định cho isHot, bạn có thể thay đổi nếu cần
      });
    }
  }
}
