import 'dart:convert';

import 'package:dart_backend/model/message.dart';
import 'package:dart_backend/util/header_util.dart';
import 'package:shelf/shelf.dart';

class ResponseUtil {
  ResponseUtil._();

  static final NOT_FOUND = Response.notFound(
    JsonEncoder().convert(Message(code: 404, message: 'Not found')),
    headers: HeaderUtil.headers,
  );

  static final NOT_MODIFY = Response.notModified();

  static final FORBIDDEN = Response.forbidden(
    JsonEncoder().convert(Message(code: 403, message: 'Not authorized')),
    headers: HeaderUtil.headers,
  );
}
