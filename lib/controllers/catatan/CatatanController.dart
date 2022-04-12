import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/api.dart';
import 'package:flutter_indoparts_apps/models/CatatanModels.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class CatatanController extends GetxController {
  var tittleAppbar = 'Catatan';
  final getstorage = GetStorage().read("dataUser") as Map<String, dynamic>;

  var loadingDelete = false.obs;
  var readpermission = false.obs;
  var createpermission = false.obs;
  var updatepermission = false.obs;
  var deletepermission = false.obs;

  var hasMore = false.obs;
  var pageNumber = 1.obs;
  var error = false.obs;
  var loading = false.obs;
  final int defaultPhotosPerPageCount = 20;
  late String search = '';
  // late List<SupportModels> dataSupport;
  final data = <CatatanModels>[].obs;
  final int nextPageThreshold = 2;

  late TextEditingController title;
  late TextEditingController notes;

  @override
  void onInit() async {
    title = TextEditingController();
    notes = TextEditingController();
    readpermission.value = await Api().permission('alatkerja-list');
    createpermission.value = await Api().permission('alatkerja-create');
    updatepermission.value = await Api().permission('alatkerja-edit');
    deletepermission.value = await Api().permission('alatkerja-delete');
    fetchData();
    super.onInit();
  }

  void searchdata(String v) async {
    search = v;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var url = (search.isNotEmpty)
          ? '/catatan-kerja?search=$search&sortBy=&sortDesc=&perpage=$defaultPhotosPerPageCount&page='
          : '/catatan-kerja?search=&sortBy=&sortDesc=&perpage=$defaultPhotosPerPageCount&page=$pageNumber';
      var response = await Api().getData(url);
      var decode = json.decode(response.body);
      print(decode);
      if (search.isNotEmpty) {
        data.clear();
      }
      List<CatatanModels> fetchedDataSupport =
          CatatanModels.parseList(decode['response']['data']);
      hasMore.value =
          fetchedDataSupport.length == defaultPhotosPerPageCount ? true : false;
      pageNumber = pageNumber + 1;
      data.addAll(fetchedDataSupport);
      print(data);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      error.value = true;
    }
  }

  void show(int id) async {
    title = TextEditingController();
    notes = TextEditingController();
    var response = await Api().getData('/support/$id');
    var decode = json.decode(response.body);
    print(decode['response']);
  }

  void store(String tittle, String notes) async {
    loading.value = true;
    var data = {
      'title': tittle,
      'notes': notes,
    };
    var response = await Api().postData(data, '/support');
    if (response.statusCode == 200) {
      fetchData();
      Get.toNamed(RouteName.catatan);
    }
    loading.value = false;
  }

  void delete(int id) async {
    loadingDelete.value = true;
    var response = await Api().deleteData('/support/$id');
    if (response.statusCode == 200) {
      fetchData();
    }
    loadingDelete.value = false;
  }
}
