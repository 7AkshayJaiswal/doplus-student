import 'dart:convert';

import 'package:student/app/api/api_component/api_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiTestController extends GetxController {
  final token = "".obs;

  void onLoginTest() async {
    http.Response response = await APIClient.postRequest(
      Uri.parse("https://education.dopluserp.com/api/login"),
      body: {
        "email": "Inspireinternational17@gmail.com",
        "password": "doplus@123"
      },
    );
    dynamic responseDecode = jsonDecode(response.body);
    dynamic jsonData = responseDecode['data'];
    dynamic jsonApiToken = jsonData['api_token'];
    dynamic jsonOriginal = jsonApiToken['original'];
    String jsonAccessToken = jsonOriginal['access_token'];
    String jsonTokenType = jsonOriginal['token_type'];
    token.value = jsonAccessToken;
    print("jsonAccessToken:: $jsonAccessToken");
    print("jsonTokenType:: $jsonTokenType");
  }

  void onLoginOut() async {
    http.Response response = await APIClient.getRequest(
      Uri.parse("https://education.dopluserp.com/api/logout"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token.value}',
      },
    );
  }

  void onUser() async {
    http.Response response = await APIClient.getRequest(
      Uri.parse("https://education.dopluserp.com/api/user"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token.value}',
      },
    );
  }

  void onOrganizations() async {
    final response = await http.get(
      Uri.parse("https://education.dopluserp.com/api/organizations?id=1"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2VkdWNhdGlvbi5kb3BsdXNlcnAuY29tL2FwaS9sb2dpbiIsImlhdCI6MTcwNzAzOTE1OCwiZXhwIjoxNzA3MDQyNzU4LCJuYmYiOjE3MDcwMzkxNTgsImp0aSI6InhiN2ZXendPTWVrb0pwaU0iLCJzdWIiOiIxMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.USYfvYO5_IxLuSoJ8tk-VPY8dedxMM-LEfNjI7r6OiU"}',
      },
    );
    print("response:: ${response.statusCode}");
    print("response:: ${response.body}");
    http.Response response2 = await APIClient.getRequest(
      Uri.parse("https://education.dopluserp.com/api/organizations?id=1"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2VkdWNhdGlvbi5kb3BsdXNlcnAuY29tL2FwaS9sb2dpbiIsImlhdCI6MTcwNzAzOTE1OCwiZXhwIjoxNzA3MDQyNzU4LCJuYmYiOjE3MDcwMzkxNTgsImp0aSI6InhiN2ZXendPTWVrb0pwaU0iLCJzdWIiOiIxMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.USYfvYO5_IxLuSoJ8tk-VPY8dedxMM-LEfNjI7r6OiU',
      },
    );
  }
}
