import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DbHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    // Requisito: Crear una base de datos local llamada usuario.db
    String path = join(await getDatabasesPath(), 'usuario.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Requisito: Crear una tabla llamada usuarios
        await db.execute('''
          CREATE TABLE usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT,
            correo TEXT,
            biografia TEXT
          )
        ''');
      },
    );
  }

  // Requisito: Guardar los datos del formulario en SQLite
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('usuarios', user.toMap());
  }

  // Requisito: Consultar el último usuario registrado
  Future<User?> getLastUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'usuarios',
      orderBy: 'id DESC',
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
