import 'package:csv/csv.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;

  static dynamic _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DBHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'tutoring_system.db');

    // Initialize databaseFactory for sqflite_common_ffi
    databaseFactory = databaseFactoryFfi;

    // Open the database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }


  void _onCreate(Database db, int newVersion) async {
    // Create tables
    await db.execute('''
      CREATE TABLE tutor (
        tutor_name TEXT PRIMARY KEY,
        education TEXT,
        institute TEXT,
        status TEXT,
        school_name TEXT,
        FOREIGN KEY (school_name) REFERENCES school(school_name)
      )
    ''');

    await db.execute('''
      CREATE TABLE school (
        school_name TEXT PRIMARY KEY
      )
    ''');

    await db.execute('''
      CREATE TABLE subject (
        subject_code TEXT PRIMARY KEY,
        tutor_name TEXT,
        school_name TEXT,
        FOREIGN KEY (tutor_name) REFERENCES tutor(tutor_name),
        FOREIGN KEY (school_name) REFERENCES school(school_name)
      )
    ''');

    await db.execute('''
      CREATE TABLE user (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_name TEXT,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE rate_and_review (
        user_id INTEGER,
        tutor_name TEXT,
        rate INTEGER,
        review TEXT,
        FOREIGN KEY (user_id) REFERENCES user(user_id),
        FOREIGN KEY (tutor_name) REFERENCES tutor(tutor_name),
        PRIMARY KEY (user_id, tutor_name)
      )
    ''');
  }
}

Future<void> importDataFromCSV() async {
  // Open database
  Database db = await DBHelper().db;

  // Parse and insert data from tutor_table.csv
  await _parseAndInsertCSV(db, 'tutor_table.csv', 'tutor');
  // print('Success done the load.');

  // Parse and insert data from school_table.csv
  await _parseAndInsertCSV(db, 'school_table.csv', 'school');

  // Parse and insert data from subject_table.csv
  await _parseAndInsertCSV(db, 'subject_table.csv', 'subject');
}

Future<void> _parseAndInsertCSV(Database db, String filename, String tableName) async {
  // Read CSV file
  String csvString = await File(filename).readAsString(encoding: latin1);
  List<List<dynamic>> csvData = CsvToListConverter().convert(csvString);
  // print('CSV Data: $csvData');
  // Remove header row
  csvData.removeAt(0);

  // Define the column names for each table
  List<String> columnNames = [];
  if (tableName == 'tutor') {
    columnNames = ['tutor_name', 'education', 'institute', 'status', 'school_name'];
  } else if (tableName == 'school') {
    columnNames = ['school_name'];
  } else if (tableName == 'subject') {
    columnNames = ['subject_code', 'tutor_name', 'school_name'];
  }

  // Insert data into database
  for (List<dynamic> row in csvData) {
    // Map CSV data to table columns
    Map<String, dynamic> rowData = {};
    for (int i = 0; i < columnNames.length; i++) {
      rowData[columnNames[i]] = row[i];  // Adjust column indices as per your CSV structure
    }

    // Check if the record already exists
    String primaryKey = columnNames[0]; // Assuming the first column is the primary key
    String primaryValue = rowData[primaryKey];
    List<Map<String, dynamic>> existingRecords = await db.query(tableName, where: '$primaryKey = ?', whereArgs: [primaryValue]);

    // If no existing record found, insert the data
    if (existingRecords.isEmpty) {
      await db.insert(tableName, rowData);
    }
  }
}



