import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<http.Response> get(String url) {
    var response = http.get(url);
    return response;
  }
}
