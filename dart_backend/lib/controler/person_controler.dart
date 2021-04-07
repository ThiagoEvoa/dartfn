import 'dart:async';
import 'dart:convert';

import 'package:dart_backend/dao/person_dao.dart';
import 'package:dart_backend/model/message.dart';
import 'package:dart_backend/model/person.dart';
import 'package:dart_backend/util/header_util.dart';
import 'package:dart_backend/util/response_util.dart';
import 'package:shelf/shelf.dart';

class PersonControler {
  PersonControler._();

  static FutureOr<Response> getPeople() async {
    final resultQuery = await PersonDao.getPeople();

    final people = resultQuery.asMap().values.map((value) {
      return Person.fromJson(value.toColumnMap());
    }).toList();

    return Response.ok(
      JsonEncoder().convert(people),
      headers: HeaderUtil.headers,
    );
  }

  static FutureOr<Response> getPerson({required int id}) async {
    late final body;
    try {
      final resultQuery = await PersonDao.getPerson(id: id);
      final person = Person.fromJson(resultQuery.first.toColumnMap());
      body = JsonEncoder().convert(person);
    } catch (ex) {
      body = JsonEncoder().convert(Person.initState());
    }

    return Response.ok(
      body,
      headers: HeaderUtil.headers,
    );
  }

  static FutureOr<Response> savePerson(
      {required Map<String, dynamic> body}) async {
    try {
      final person = Person.fromJson(body);
      await PersonDao.savePerson(person: person);
      return Response.ok(
        JsonEncoder().convert(Message(code: 200, message: 'Person saved.')),
        headers: HeaderUtil.headers,
      );
    } catch (ex) {
      return ResponseUtil.NOT_MODIFY;
    }
  }

  static FutureOr<Response> updatePerson(
      {required Map<String, dynamic> body}) async {
    try {
      final person = Person.fromJson(body);
      final resultQuery = await PersonDao.updatePerson(person: person);
      if (resultQuery.affectedRowCount == 1) {
        return Response.ok(
          JsonEncoder().convert(Message(code: 200, message: 'Person updated.')),
          headers: HeaderUtil.headers,
        );
      } else {
        return ResponseUtil.NOT_MODIFY;
      }
    } catch (ex) {
      return ResponseUtil.NOT_MODIFY;
    }
  }

  static FutureOr<Response> deletePerson({required int id}) async {
    try {
      print(id);
      final resultQuery = await PersonDao.deletePerson(id: id);
      if (resultQuery.affectedRowCount == 1) {
        return Response.ok(
          JsonEncoder().convert(Message(code: 200, message: 'Person deleted.')),
          headers: HeaderUtil.headers,
        );
      } else {
        return ResponseUtil.NOT_MODIFY;
      }
    } catch (ex) {
      return ResponseUtil.NOT_MODIFY;
    }
  }
}
