import 'package:flutter_indoparts_apps/routes/route_name.dart';
import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  void changePage(int i) async {
    print('click index=$i');
    pageIndex.value = i;
    switch (i) {
      case 0:
        Get.offAllNamed(RouteName.home);
        break;
      case 1:
        Get.offAllNamed(RouteName.pemberitahuan);
        break;
      case 2:
        Get.offAllNamed(RouteName.catatan);
        break;
      case 3:
        Get.offAllNamed(RouteName.absensi);
        break;
      case 4:
        Get.offAllNamed(RouteName.profile);
        break;
    }
  }
}
