import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:student/app/utils/singletons/storage.singleton.dart';

class APIClient {
  static Future<http.Response> getRequest(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    log("Get:::-> '$url', $headers");
    var response = await http.get(
      url,
      headers: headers ??
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Storage.accessToken}',
          },
    );
    log("Get:::<- '$url', ${response.statusCode}, ${response.body}");
    return response;
  }

  static Future<http.Response> postRequest(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    log("Post:::-> '$url', $body, $headers");
    var response = await http.post(
      url,
      body: body,
      headers: headers ??
          {
            // 'Content-Type': 'application/json',
            // 'Accept': 'application/json',
            'Authorization': 'Bearer ${Storage.accessToken}',
          },
    );
    log("Post:::<- '$url', $body', ${response.statusCode}, ${response.body}");
    return response;
  }
}
