import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _url = 'http://192.168.49.128:8000/api';
  var token;

  _getToken() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final getstorage = GetStorage().read("dataUser") as Map<String, dynamic>;
      token = getstorage['token'];
    }
  }

  permission(String permission) async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final getstorage = GetStorage().read("dataUser") as Map<String, dynamic>;
      final validate = getstorage['permission'].contains(permission);
      return validate;
    }
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse("$_url$apiUrl");
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  postData(data, apiUrl) async {
    var fullUrl = Uri.parse("$_url$apiUrl");
    await _getToken();
    return await http.post(fullUrl, body: data, headers: _setHeaders());
  }

  putData(data, apiUrl) async {
    var fullUrl = Uri.parse("$_url$apiUrl");
    await _getToken();
    return await http.put(fullUrl, body: data, headers: _setHeaders());
  }

  deleteData(apiUrl) async {
    var fullUrl = Uri.parse("$_url$apiUrl");
    await _getToken();
    return await http.delete(fullUrl, headers: _setHeaders());
  }

  callProfileData(token) async {
    var fullUrl = Uri.parse("$_url/auth");
    await _getToken();
    return await http.get(fullUrl, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });
  }

  _setHeaders() => {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json'
      };
}
