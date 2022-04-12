import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanController.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class CatatanFormViews extends GetView<CatatanController> {
  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset:
    false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Catatan Baru"),
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
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controller.title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tittle Notes',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller.notes,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  minLines: 18,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () => {
                      controller.store(
                          controller.title.text, controller.notes.text)
                    },
                    child: Obx(() => controller.loading.isTrue
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("Save",
                            style: TextStyle(
                              fontSize: 18,
                            ))),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
