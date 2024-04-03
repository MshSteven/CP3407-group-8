// import 'package:flutter_test/flutter_test.dart';
// import 'package:project/db/db.dart';
// import 'package:sqflite_common/sqlite_api.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // 这行确保您导入了 sqflite_ffi 包
//
// void main() {
//   setUpAll(() async {
//     // Initialize sqflite for ffi
//     sqfliteFfiInit();
//     // Initialize databaseFactory for sqflite_common_ffi
//     databaseFactory = databaseFactoryFfi;
//
//     // Import data from CSV files
//     await importDataFromCSV();
//   });
//
//   group('Database Tests', () {
//
//     // Define a test to check if the database is created
//     test('Database creation test', () async {
//       DBHelper dbHelper = DBHelper();
//       var db = await dbHelper.db;
//       expect(db.isOpen, true);
//     });
//
//     // Define a test to check if the tutor table has been populated
//     test('Tutor table data test', () async {
//       DBHelper dbHelper = DBHelper();
//       var db = await dbHelper.db;
//       var tutors = await db.rawQuery('SELECT * FROM tutor');
//       // print('Tutors: $tutors');
//       expect(tutors.length > 0, true);
//     });
//
//     // Define a test to check if the school table has been populated
//     test('School table data test', () async {
//       DBHelper dbHelper = DBHelper();
//       var db = await dbHelper.db;
//       var schools = await db.rawQuery('SELECT * FROM school');
//       expect(schools.length > 0, true);
//     });
//
//     // Define a test to check if the subject table has been populated
//     test('Subject table data test', () async {
//       DBHelper dbHelper = DBHelper();
//       var db = await dbHelper.db;
//       var subjects = await db.rawQuery('SELECT * FROM subject');
//       expect(subjects.length > 0, true);
//     });
//   });
// }
