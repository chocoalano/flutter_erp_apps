import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AbsensiController extends GetxController {
  var tittleAppbar = 'Absensi';

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  Future<void> perbaharuimap() async {
    getCurrentLocation();
  }

  void getCurrentLocation() async {}

  void klake() async {
    perbaharuimap();
  }
}
