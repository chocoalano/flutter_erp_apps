import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/api.dart';
import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var tittleAppbar = 'Profil';
  var loading = false.obs;
  var hidden1 = true.obs;
  var hidden2 = true.obs;
  var hidden3 = true.obs;

  late TextEditingController nama;
  late TextEditingController email;

  late TextEditingController passwordOld;
  late TextEditingController passwordNew;
  late TextEditingController passwordConfirm;

  @override
  void onInit() async {
    super.onInit();
    nama = TextEditingController();
    email = TextEditingController();
    passwordOld = TextEditingController();
    passwordNew = TextEditingController();
    passwordConfirm = TextEditingController();
    var response = await Api().getData('/auth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      nama.text = data['response']['user']['name'];
      email.text = data['response']['user']['email'];
    }
  }

  void save(String name, String email) async {
    loading.value = true;
    var data = {'name': name, 'email': email};
    var response = await Api().postData(data, '/profil-update');
    if (response.statusCode == 200) {
      loading.value = false;
      Get.snackbar(
        "${response.statusCode}",
        response.statusCode == 200 ? "success" : "error!",
      );
    }
    Get.offAllNamed(RouteName.profile);
  }

  void updatePassword(
      String passOld, String passNew, String passConfirm) async {
    loading.value = true;
    final box = GetStorage();
    final data = box.read("dataUser") as Map<String, dynamic>;
    if (passOld == data["password"]) {
      var data = {
        'old_password': passOld,
        'new_password': passNew,
        'confirm_password': passConfirm
      };
      var response = await Api().postData(data, '/profil-password');
      var res = jsonDecode(response.body);
      loading.value = false;
      if (response.statusCode == 200) {
        final box = GetStorage();
        if (box.read("dataUser") != null) {
          final data = box.read("dataUser") as Map<String, dynamic>;
          data['password'] = passConfirm;
        }
        Get.snackbar(
          "Success",
          "Password anda berhasil diperbaharui",
        );
        Get.offAllNamed(RouteName.profile);
      } else {
        Get.snackbar(
          'errors',
          res['response']['message'],
        );
      }
    }
    Get.snackbar(
      "Unauthorized",
      "Password lama anda salah!",
    );
  }

  @override
  void dispose() {
    nama.dispose();
    email.dispose();
    super.dispose();
  }
}
