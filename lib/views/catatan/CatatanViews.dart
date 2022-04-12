import 'dart:convert';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanController.dart';
import 'package:flutter_indoparts_apps/models/CatatanModels.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:flutter_indoparts_apps/views/components/BottomNavigation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CatatanViews extends StatelessWidget {
  final c = Get.find<CatatanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          title: Text(c.tittleAppbar),
          onSearch: (value) => {c.searchdata(value)},
        ),
        body: getBody(),
        floatingActionButton: Obx(() => new Visibility(
            visible: c.createpermission.value,
            child: new FloatingActionButton(
              onPressed: () {
                Get.offAllNamed(RouteName.catatanForm);
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.indigo,
            ))),
        bottomNavigationBar: BottomNavigation());
  }

  Widget getBody() {
    return Container(
      child: Obx(() {
        return c.readpermission.isTrue
            ? c.loading.isFalse
                ? ListView.builder(
                    itemCount: c.data.length,
                    itemBuilder: (context, index) {
                      // if (index == c.data.length - c.nextPageThreshold) {
                      if (index == c.data.length) {
                        c.fetchData();
                      }
                      if (c.loading.isTrue) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        CatatanModels data = c.data[index];
                        return new InkWell(
                          splashColor: Colors.indigo,
                          onTap: () => {
                            Get.offAllNamed(RouteName.catatanShow,
                                arguments: data.id.toInt())
                          },
                          child: Card(
                            child: ListTile(
                              title: Text('testt'),
                              subtitle: Text(data.title),
                              trailing: IconButton(
                                color: Colors.purple.shade800,
                                icon: const Icon(Icons.delete),
                                tooltip: 'Delete ${data.title}',
                                onPressed: () => {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext contex) =>
                                          AlertDialog(
                                            title: Text('Hapus Data'),
                                            content: Text(
                                                'Apakah anda yakin akan menghapus data ini?'),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    c.delete(data.id.toInt());
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Hapus Sekarang',
                                                  )),
                                            ],
                                          ))
                                },
                              ),
                            ),
                            elevation: 9,
                          ),
                        );
                      }
                    },
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircularProgressIndicator(),
                    ),
                  )
            : Container(
                child: Text('Permission Denied!'),
              );
      }),
    );
  }
}
