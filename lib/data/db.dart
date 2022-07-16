// @dart=2.9
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:blocplay2/data/employee_model.dart';


class EmployeeDB {
  static Database database;
  static Future<Database> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), "Employee_database.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE Employees(id INTEGER PRIMARY KEY,name TEXT,username TEXT,email TEXT, profile_image TEXT, phone TEXT, website TEXT )"
        );
      },

      // Version
      version: 1,
    );
    return database;
  }

  // Check database connected
  static Future<Database> getDatabaseConnect() async {
    if (database != null) {
      return database;
    }
    else {
      return await initDatabase();
    }
  }

  // Show all data
  static Future<List<Employee>> showAllData() async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.query("Employees");

    return List.generate(maps.length, (i) {
      return Employee.fromJson(maps[i]);
    });
  }

  // Insert
  static Future<void> insertData(Employee employee) async {
    final Database db = await getDatabaseConnect();
    await db.insert(
      "Employees",
      employee.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  static Future<void> updateData(Employee employee) async {
    final db = await getDatabaseConnect();
    await db.update(
      "Employees",
      employee.toMap(),
      where: "id = ?",
      whereArgs: [employee.id],
    );
  }

  // Delete
  static Future<void> deleteData(int id) async {
    final db = await getDatabaseConnect();
    await db.delete(
      "Employees",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}