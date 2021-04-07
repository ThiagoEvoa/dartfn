class HeaderUtil {
  HeaderUtil._();

  static final headers = <String, Object>{
    'content-type': 'application/json;charset=utf-8',
  };

  static void addHeader({String? authorization}) {
    if (authorization != null) {
      headers.addAll({'authorization': authorization});
    }
  }
}
