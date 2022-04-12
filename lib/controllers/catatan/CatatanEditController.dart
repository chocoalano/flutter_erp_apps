import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_indoparts_apps/api.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CatatanEditController extends GetxController {
  dynamic id = Get.arguments;
  final getstorage = GetStorage().read("dataUser") as Map<String, dynamic>;
  var loading = false.obs;

  late TextEditingController title;
  late TextEditingController notes;

  @override
  void onInit() async {
    super.onInit();
    title = TextEditingController();
    notes = TextEditingController();
    var response = await Api().getData('/catatan-kerja/$id');
    var decode = json.decode(response.body);
    title.text = decode['response']['title'];
    notes.text = decode['response']['notes'];
  }

  void updateData(String tittle, String notes) async {
    loading.value = true;
    var data = {
      'title': tittle,
      'notes': notes,
    };
    var response = await Api().putData(data, '/support/$id');
    if (response.statusCode == 200) {
      Get.toNamed(RouteName.catatan);
    }
    loading.value = false;
  }

  @override
  void dispose() {
    title.dispose();
    notes.dispose();
    super.dispose();
  }
}
