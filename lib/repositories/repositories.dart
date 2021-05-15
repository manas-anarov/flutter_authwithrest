import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:html';

class UserRepository {
  static String mainUrl = "https://reqres.in";
  var loginUrl = '$mainUrl/api/login';

  // final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  final Storage _localStorage = window.localStorage;

  // Future<bool> hasToken() async {
  //   var value = await storage.read(key: 'token');

  //   // var value = "sas";
  //   if (value != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<bool> hasTokenWeb() async {
    // var value = await storage.read(key: 'token');
    var value = _localStorage['token'];

    // var value = "sas";
    if (value != null) {
      return true;
    } else {
      return false;
    }

    // Future<String> getId() async => _localStorage['selected_id'];

    // Future invalidate() async {
    //   _localStorage.remove('selected_id');
    // }
  }

  Future<void> persistToken(String token) async {
    // await storage.write(key: 'token', value: token);
  }

  Future<void> persistTokenWeb(String token) async {
    // await storage.write(key: 'token', value: token);
    _localStorage['token'] = token;
  }

  Future<void> deleteToken() async {
    // storage.delete(key: 'token');
    // storage.deleteAll();
  }

  Future<void> deleteTokenWeb() async {
    // storage.delete(key: 'token');
    // storage.deleteAll();
    _localStorage.remove('token');
  }

  Future<String> login(String phone, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": phone,
      "password": password,
    });
    return response.data["token"];
  }
}
