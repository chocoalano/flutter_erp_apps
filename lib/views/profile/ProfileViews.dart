import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class ProfileViews extends StatelessWidget {
  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Profile"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Users Name',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.offAllNamed(RouteName.updateAccount);
                    },
                    leading: Icon(Icons.person),
                    title: Text('Update Account'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.offAllNamed(RouteName.updatePassword);
                    },
                    leading: Icon(Icons.password),
                    title: Text('Change Password'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.offAllNamed(RouteName.bantuan);
                    },
                    leading: Icon(Icons.help_center),
                    title: Text('Bantuan'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      auth.logout(c.rememberme.value);
                    },
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
