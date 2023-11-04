import 'package:http/http.dart' as http;

class CustomHttp {
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return await http.get(
      url,
      headers: headers,
    );
  }
}
