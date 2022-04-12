import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/controllers/profileController.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class UpdatePasswordViews extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Update Password"),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => TextField(
                    controller: controller.passwordOld,
                    autocorrect: false,
                    obscureText: controller.hidden1.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password Lama",
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidden1.toggle(),
                          icon: controller.hidden1.isTrue
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintStyle: TextStyle(color: Colors.grey.shade400)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => TextField(
                    controller: controller.passwordNew,
                    autocorrect: false,
                    obscureText: controller.hidden2.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password Baru",
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidden2.toggle(),
                          icon: controller.hidden2.isTrue
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintStyle: TextStyle(color: Colors.grey.shade400)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => TextField(
                    controller: controller.passwordConfirm,
                    autocorrect: false,
                    obscureText: controller.hidden3.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Konfirmasi Password",
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidden3.toggle(),
                          icon: controller.hidden3.isTrue
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintStyle: TextStyle(color: Colors.grey.shade400)),
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
                      controller.updatePassword(
                          controller.passwordOld.text,
                          controller.passwordNew.text,
                          controller.passwordConfirm.text)
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
