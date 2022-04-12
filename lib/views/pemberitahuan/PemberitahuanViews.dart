import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/PemberitahuanController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/BottomNavigation.dart';

class PemberitahuanViews extends GetView<PemberitahuanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          title: Text(controller.tittleAppbar),
          onSearch: (value) => {print(value)},
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
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
