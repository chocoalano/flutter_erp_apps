import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/HomeController.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/views/Animation/FadeAnimation.dart';
import 'package:flutter_indoparts_apps/views/beranda/categories.dart';
import 'package:flutter_indoparts_apps/views/beranda/headers.dart';
import 'package:flutter_indoparts_apps/views/beranda/pengumuman.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class HomeViews extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Header(),
                Categories(),
                Pengumuman(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
