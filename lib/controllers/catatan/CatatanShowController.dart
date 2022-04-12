import 'dart:convert';

import 'package:flutter_indoparts_apps/api.dart';
import 'package:get/get.dart';

class CatatanShowController extends GetxController {
  dynamic id = Get.arguments;

  var dataid = 0.obs;
  var title = ''.obs;
  var notes = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    show(id);
  }

  void show(int id) async {
    var response = await Api().getData('/catatan-kerja/$id');
    var decode = json.decode(response.body);
    title.value = decode['response']['title'];
    notes.value = decode['response']['notes'];
    dataid.value = decode['response']['id'];
  }
}
