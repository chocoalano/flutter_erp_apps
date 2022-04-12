import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/api.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthC extends GetxController {
  var isAuth = false.obs;
  var loading = false.obs;
  String __token = '';

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      middleText: msg,
    );
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      login(data["email"], data["password"], data["rememberme"]);
    }
  }

  void login(String email, String pass, bool rememberme) async {
    loading.value = true;
    if (email != '' && pass != '') {
      if (GetUtils.isEmail(email)) {
        var response =
            await Api().postData({'email': email, 'password': pass}, '/login');
        if (response.statusCode == 200) {
          loading.value = false;
          var res = jsonDecode(response.body);
          __token = res['response'];
          var callprofile = await Api().callProfileData(__token);
          if (callprofile.statusCode == 200) {
            var setpermission = jsonDecode(callprofile.body);
            final box = GetStorage();
            box.write(
              'dataUser',
              {
                "email": email,
                "password": pass,
                "rememberme": rememberme,
                "token": __token,
                "permission": setpermission['response']['permission'],
                "username": setpermission['response']['user']['name'],
              },
            );
            isAuth.value = true;
            Get.offAllNamed(RouteName.home);
          } else {
            loading.value = false;
            dialogError("Data user tidak valid. Gunakan akun lainnya.");
            clearStorage();
          }
        } else {
          loading.value = false;
          dialogError("Data user tidak valid. Gunakan akun lainnya.");
          clearStorage();
        }
      } else {
        dialogError("Email tidak valid.");
        loading.value = false;
      }
    } else {
      dialogError("Semua data input harus diisi.");
      loading.value = false;
    }
  }

  void logout(bool rememberme) async {
    var response = await Api().postData({}, '/logout');
    print(response.statusCode);
    if (response.statusCode == 200) {
      isAuth.value = false;
      clearStorage();
      Get.offAllNamed(RouteName.login);
    }
  }

  void clearStorage() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
    }
  }
}
