import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:efficom_app/models/user.dart';

class UserDatabaseHelper {
  UserDatabaseHelper._privateConstructor();

  static final UserDatabaseHelper instance =
  UserDatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (database != null) return database;
    _database = await _createDatabase();
    return _database;
  }

  _createDatabase() async {
    final database = openDatabase(
        join(await getDatabasesPath(), 'user_database.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, firstname TEXT, lastname TEXT, age INTEGER)');
        },
        version: 1,
    );
    return database;
  }

  Future<int> insertUser(User user) async {
    await _database.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getUsers() async {

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await _database.query('users');

    // Convert the List<Map<String, dynamic> into a List<User>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        firstName: maps[i]['firstname'],
        lastName: maps[i]['lastname'],
        age: maps[i]['age'],
      );
    });
  }

  Future<User> getUser(int id) async {
    final Database db = await instance.database;
    List<Map> results = await db.query("users",
        columns: ["id", "first_name", "last_name", "age"],
        where: 'id = ?',
        whereArgs: [id]);

    if (results.length > 0) {
      return new User.fromJson(results.first);
    }

    return null;
  }

  Future<int> updateCustomer(User user) async {
    return await _database.update("users", user.toMap(), where: "id = ?", whereArgs: [user.id]);
  }
}
