import 'package:mysql1/mysql1.dart';

class DBConnector {
  Future<MySqlConnection> _connectToMySql() async {
    final connectionSettings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '19981124msh',
      db: 'tutoring_system',
    );
    return MySqlConnection.connect(connectionSettings);
  }

  Future<List<Map<String, dynamic>>> executeQuery(String query) async {
    final connection = await _connectToMySql();
    final results = await connection.query(query);
    final mappedResults = results.toList().cast<Map<String, dynamic>>();
    await connection.close();
    return mappedResults;
  }
}