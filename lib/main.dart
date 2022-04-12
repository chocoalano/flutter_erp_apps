import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/HomeController.dart';
import 'package:flutter_indoparts_apps/controllers/PageIndexController.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:flutter_indoparts_apps/views/beranda/HomeViews.dart';
import 'package:flutter_indoparts_apps/views/login.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/routes/app_page.dart';

void main() async {
  await GetStorage.init();
  final page = Get.put(PageIndexController(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());
  final homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authC.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: authC.isAuth.isTrue ? HomeViews() : LoginViews(),
              getPages: AppPage.pages,
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
