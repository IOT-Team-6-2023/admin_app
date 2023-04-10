import 'package:http/http.dart' as http;

class HTTPClient {
  Future<dynamic> get({required Uri uri, dynamic headers}) {
    return http.get(uri, headers: headers ?? {});
  }

  Future<dynamic> post({required Uri uri, dynamic body, dynamic headers}) {
    print(body);
    if (uri.toString().contains('party')) {
      body["party_id"] = body["party_id"].toString();
    }
    if (uri.toString().contains('candidates')) {
      body["party"] = body["party"].toString();
      body["constituency"] = body["constituency"].toString();
      body.remove("party_name");
      body.remove("constituency_name");
    }
    print(body);
    return http.post(uri, body: body, headers: headers ?? {});
  }
}
