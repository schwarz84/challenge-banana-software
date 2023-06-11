import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'dummyjson.com';

  Future<String?> login(String username, String password) async {
    final Map<String, dynamic> authData = {
      'username': username,
      'password': password
    };

    final url = Uri.https(_baseUrl, 'auth/login');

    final resp = await http.post(url, body: authData);


    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    return decodeResp['message'];

  }
}