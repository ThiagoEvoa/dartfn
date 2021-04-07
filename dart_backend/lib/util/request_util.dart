import 'dart:convert';

import 'package:shelf/shelf.dart';

class RequestUtil {
  RequestUtil._();

  static Future<String> getBody({required Request request}) async {
    late final body;
    body = await utf8.decodeStream(request.read());
    return body;
  }
}
