import 'package:path/path.dart';
import 'package:setting_app/database/name_tables.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

   Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

   Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "setting_app.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        //create table customer
        db.execute("CREATE TABLE ${NameTables.ACCOUNT}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, email TEXT, password TEXT)");
      },
    );
    return database;
  }
}
