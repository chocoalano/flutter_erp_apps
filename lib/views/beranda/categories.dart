import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories1 = [
      {"icon": "assets/svg/fingerprint.svg", "text": "Absen"},
      {"icon": "assets/svg/izin.svg", "text": "Izin"},
      {"icon": "assets/svg/cuti.svg", "text": "Cuti"},
    ];
    List<Map<String, dynamic>> categories2 = [
      {"icon": "assets/svg/undraw_diary_re_4jpc.svg", "text": "Inventaris"},
      {"icon": "assets/svg/notes.svg", "text": "Catatan"},
      {"icon": "assets/svg/koperasi.svg", "text": "Koperasi"},
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              categories1.length,
              (index) => CategoryCard(
                icon: categories1[index]["icon"],
                text: categories1[index]["text"],
                press: () {
                  switch (index) {
                    case 0:
                      Get.offAllNamed(RouteName.absensi);
                      break;
                    case 1:
                      Get.offAllNamed(RouteName.izin);
                      break;
                    case 2:
                      Get.offAllNamed(RouteName.cuti);
                      break;
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              categories2.length,
              (index) => CategoryCard(
                icon: categories2[index]["icon"],
                text: categories2[index]["text"],
                press: () {
                  switch (index) {
                    case 0:
                      Get.offAllNamed(RouteName.inventaris);
                      break;
                    case 1:
                      Get.offAllNamed(RouteName.catatan);
                      break;
                    case 2:
                      Get.offAllNamed(RouteName.koperasi);
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
