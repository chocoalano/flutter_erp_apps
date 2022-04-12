import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanController.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanShowController.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class CatatanShow extends StatelessWidget {
  final c = Get.find<CatatanShowController>();
  final cekUpdatePermission = Get.find<CatatanController>();
  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset:
    false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Detail Catatan"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.offAllNamed(RouteName.catatan);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(c.title.value),
                SizedBox(
                  height: 10,
                ),
                Text(c.notes.value),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(() => new Visibility(
          visible: cekUpdatePermission.updatepermission.value,
          child: new FloatingActionButton(
            onPressed: () {
              Get.offAllNamed(RouteName.catatanEdit,
                  arguments: c.dataid.toInt());
            },
            child: const Icon(Icons.update),
            backgroundColor: Colors.indigo,
          ))),
    );
  }
}
