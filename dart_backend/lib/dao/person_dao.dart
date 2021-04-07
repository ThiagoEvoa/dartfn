import 'dart:async';

import 'package:dart_backend/model/person.dart';
import 'package:dart_backend/util/db_util.dart';
import 'package:postgres/postgres.dart';

class PersonDao {
  PersonDao._();

  static Future<PostgreSQLResult> getPeople() async {
    final connection = await DBUtil.getConnection();
    final result = await connection.query('SELECT * from _person');
    return result;
  }

  static Future<PostgreSQLResult> getPerson({required int id}) async {
    final connection = await DBUtil.getConnection();
    final result = await connection.query(
      'SELECT * from _person WHERE id = @id',
      substitutionValues: {
        'id': id,
      },
    );
    return result;
  }

  static Future<PostgreSQLResult> savePerson({required Person person}) async {
    final connection = await DBUtil.getConnection();
    final result = await connection.query(
      'INSERT INTO _person ("name", "email") VALUES(@name, @email)',
      substitutionValues: {
        'name': person.name,
        'email': person.email,
      },
    );
    return result;
  }

  static Future<PostgreSQLResult> updatePerson({required Person person}) async {
    final connection = await DBUtil.getConnection();
    final result = await connection.query(
      'UPDATE _person SET name = @name, email = @email WHERE id = @id',
      substitutionValues: {
        'id': person.id,
        'name': person.name,
        'email': person.email,
      },
    );
    return result;
  }

  static Future<PostgreSQLResult> deletePerson({required int id}) async {
    final connection = await DBUtil.getConnection();
    final result = await connection.query(
      'DELETE FROM _person WHERE id = @id',
      substitutionValues: {
        '@id': id,
      },
    );
    return result;
  }
}
