import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/PageIndexController.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final page = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.indigo,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.notifications, title: 'Notif'),
        TabItem(icon: Icons.auto_stories_sharp, title: 'Catatan'),
        TabItem(icon: Icons.fingerprint, title: 'Absensi'),
        TabItem(icon: Icons.account_circle, title: 'Profile'),
      ],
      initialActiveIndex: page.pageIndex.value,
      onTap: (int i) => page.changePage(i),
    );
  }
}
