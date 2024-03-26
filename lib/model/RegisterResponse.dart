import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class RegisterResponse {
  String id;
  String name;
  String job;
  String createAt;

  RegisterResponse(
      {required this.id,
      required this.name,
      required this.job,
      required this.createAt});

  factory RegisterResponse.createRegisterResponse(Map<String, dynamic> object) {
    return RegisterResponse(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        createAt: object['createAt']);
  }

  static Future<RegisterResponse> connectToAPI(String name, String job) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users");
    var apiResult = await http.post(apiUrl, body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);

    return RegisterResponse.createRegisterResponse(jsonObject);
  }
}
