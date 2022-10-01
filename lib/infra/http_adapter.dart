import 'dart:convert';

import 'package:http/http.dart';

import '../data/http/http_client.dart';
import '../data/http/http_error.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
  }) async {
    late Response res;
    try {
      res = await client.get(Uri.parse(url));
    } catch (e) {
      throw HttpError.serverError;
    }
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else if (res.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (res.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (res.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (res.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
