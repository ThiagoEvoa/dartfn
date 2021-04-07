import 'package:postgres/postgres.dart';

class DBUtil {
  DBUtil._();

  static final _connection = PostgreSQLConnection(
    '',
    5432,
    '',
    username: '',
    password: '',
  );

  static Future<PostgreSQLConnection> getConnection() async {
    if (_connection.isClosed) {
      await _connection.open();
    }
    return _connection;
  }
}
