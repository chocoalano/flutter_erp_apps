import 'dart:async';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/AbsensiController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/BottomNavigation.dart';

class AbsensiViews extends GetView<AbsensiController> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.2106689, 106.5654112),
    zoom: 14.4746,
  );

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(-6.2106689, 106.5654112),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _goToTheLake,
          child: const Icon(Icons.directions_boat),
          backgroundColor: Colors.indigo,
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
