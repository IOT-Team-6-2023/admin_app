import 'package:http/http.dart' as http;

class HTTPClient {
  Future<dynamic> get({required Uri uri, dynamic headers}) {
    return http.get(uri, headers: headers ?? {});
  }

  Future<dynamic> post({required Uri uri, dynamic body, dynamic headers}) {
    return http.post(uri, body: body, headers: headers);
  }
}
