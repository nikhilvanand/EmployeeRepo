/* @dart=2.9
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
      version: 1,
    );
    return database;
  }

  static Future<Database> getDatabaseConnect() async {
    if (database != null) {
      return database;
    }
    else {
      return await initDatabase();
    }
  }

  static Future<List<Employee>> showAllData() async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.query("Employees");

    return List.generate(maps.length, (i) {
      return Employee.fromJson(maps[i]);
    });
  }
*/
