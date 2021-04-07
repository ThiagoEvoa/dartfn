import 'dart:async';
import 'dart:convert';

import 'package:dart_backend/controler/person_controler.dart';
import 'package:dart_backend/model/message.dart';
import 'package:dart_backend/model/method_enum.dart';
import 'package:dart_backend/model/path_enum.dart';
import 'package:dart_backend/util/header_util.dart';
import 'package:dart_backend/util/request_util.dart';
import 'package:dart_backend/util/response_util.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

/*
final requestBody =
      JsonDecoder().convert(await utf8.decodeStream(request.read()));
  final requestParams = request.url.queryParameters;
  final requestPaths = request.url.pathSegments;
  final headers = request.headers;
  dart run bin/server.dart --port 8080 --target <functionName>
*/

@CloudFunction(target: 'person')
FutureOr<Response> getPeople(Request request) async {
  final headersKeys = request.headers.keys;
  final containsAuthorization = headersKeys.contains('authorization');
  final containsAuthorizationValue =
      request.headers.containsValue('u should not pass');
  final url = request.url;
  final requestPaths = url.pathSegments;
  final body =
      JsonDecoder().convert(await RequestUtil.getBody(request: request));
  late final response;

  if (containsAuthorization && containsAuthorizationValue) {
    switch (request.method) {
      case MethodEnum.DELETE:
        {
          if (url.hasEmptyPath) {
            response = ResponseUtil.NOT_FOUND;
          } else {
            if (requestPaths[0] == PathEnum.PERSON) {
              response = PersonControler.deletePerson(
                id: int.tryParse(requestPaths[1]) ?? -1,
              );
            } else {
              response = ResponseUtil.NOT_FOUND;
            }
          }
          break;
        }
      case MethodEnum.PUT:
        response = PersonControler.updatePerson(body: body);
        break;
      case MethodEnum.POST:
        response = PersonControler.savePerson(body: body);
        break;
      default:
        if (url.hasEmptyPath) {
          response = ResponseUtil.NOT_FOUND;
        } else {
          switch (requestPaths[0]) {
            case PathEnum.PEOPLE:
              response = PersonControler.getPeople();
              break;
            case PathEnum.PERSON:
              response = PersonControler.getPerson(
                id: int.tryParse(requestPaths[1]) ?? -1,
              );
              break;
            default:
              response = ResponseUtil.NOT_FOUND;
          }
        }
    }
    return response;
  } else {
    return ResponseUtil.FORBIDDEN;
  }
}

@CloudFunction(target: 'token')
FutureOr<Response> getToken(Request request) {
  final url = request.url;
  final requestPaths = url.pathSegments;
  late final response;

  switch (request.method) {
    case MethodEnum.GET:
      {
        if (url.hasEmptyPath) {
          response = ResponseUtil.NOT_FOUND;
        } else {
          switch (requestPaths[0]) {
            case PathEnum.TOKEN:
              response = Response.ok(
                JsonEncoder()
                    .convert(Message(code: 200, message: 'u should not pass')),
                headers: HeaderUtil.headers,
              );
              break;
            default:
              response = ResponseUtil.FORBIDDEN;
          }
        }
        return response;
      }
    default:
      return ResponseUtil.NOT_FOUND;
  }
}
