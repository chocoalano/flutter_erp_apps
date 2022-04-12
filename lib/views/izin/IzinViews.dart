import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/IzinController.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IzinViews extends GetView<IzinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(controller.tittleAppbar),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(RouteName.home);
            },
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('dataasdasd'),
                  subtitle: Text('Here is a second line'),
                  trailing: Icon(Icons.arrow_right),
                ),
                elevation: 9,
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('dataasdasd'),
                  subtitle: Text('Here is a second line'),
                  trailing: Icon(Icons.arrow_right),
                ),
                elevation: 9,
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('dataasdasd'),
                  subtitle: Text('Here is a second line'),
                  trailing: Icon(Icons.arrow_right),
                ),
                elevation: 9,
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('dataasdasd'),
                  subtitle: Text('Here is a second line'),
                  trailing: Icon(Icons.arrow_right),
                ),
                elevation: 9,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: Colors.indigo,
        ));
  }
}
