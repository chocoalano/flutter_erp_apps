import 'package:flutter_indoparts_apps/controllers/AbsensiController.dart';
import 'package:flutter_indoparts_apps/controllers/CutiController.dart';
import 'package:flutter_indoparts_apps/controllers/HomeController.dart';
import 'package:flutter_indoparts_apps/controllers/InventarisController.dart';
import 'package:flutter_indoparts_apps/controllers/IzinController.dart';
import 'package:flutter_indoparts_apps/controllers/KoperasiController.dart';
import 'package:flutter_indoparts_apps/controllers/PemberitahuanController.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/controllers/bantuanController.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanController.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanEditController.dart';
import 'package:flutter_indoparts_apps/controllers/catatan/CatatanShowController.dart';
import 'package:flutter_indoparts_apps/controllers/profileController.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthC>(AuthC());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}

// BINDING CATATAN::STARTED
class CatatanBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CatatanController>(CatatanController());
  }
}

class CatatanShowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CatatanShowController>(CatatanShowController());
  }
}

class CatatanEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CatatanEditController>(CatatanEditController());
  }
}
// BINDING CATATAN::ENDED

class BantuanBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BantuanController>(BantuanController());
  }
}

class AbsensiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AbsensiController>(AbsensiController());
  }
}

class PemberitahuanBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PemberitahuanController>(PemberitahuanController());
  }
}

class IzinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IzinController>(IzinController());
  }
}

class CutiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CutiController>(CutiController());
  }
}

class InventarisBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InventarisController>(InventarisController());
  }
}

class KoperasiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<KoperasiController>(KoperasiController());
  }
}
