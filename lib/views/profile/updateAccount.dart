import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/controllers/profileController.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class UpdateAccountViews extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Update Account"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(RouteName.profile);
            },
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: controller.nama,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () => {
                    controller.save(controller.nama.text, controller.email.text)
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
        ));
  }
}
