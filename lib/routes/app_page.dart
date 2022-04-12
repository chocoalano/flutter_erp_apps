import 'package:flutter_indoparts_apps/bindings/Binding.dart';
import 'package:flutter_indoparts_apps/views/BantuanViews.dart';
import 'package:flutter_indoparts_apps/views/absensi/AbsensiViews.dart';
import 'package:flutter_indoparts_apps/views/beranda/HomeViews.dart';
import 'package:flutter_indoparts_apps/views/catatan/CatatanEdit.dart';
import 'package:flutter_indoparts_apps/views/catatan/CatatanFormViews.dart';
import 'package:flutter_indoparts_apps/views/catatan/CatatanShow.dart';
import 'package:flutter_indoparts_apps/views/catatan/CatatanViews.dart';
import 'package:flutter_indoparts_apps/views/cuti/CutiViews.dart';
import 'package:flutter_indoparts_apps/views/inventaris/InventarisViews.dart';
import 'package:flutter_indoparts_apps/views/izin/IzinViews.dart';
import 'package:flutter_indoparts_apps/views/koperasi/KoperasiViews.dart';
import 'package:flutter_indoparts_apps/views/pemberitahuan/PemberitahuanViews.dart';
import 'package:flutter_indoparts_apps/views/profile/ProfileViews.dart';
import 'package:flutter_indoparts_apps/views/profile/updateAccount.dart';
import 'package:flutter_indoparts_apps/views/profile/updatePassword.dart';
import 'package:get/get.dart';

import 'route_name.dart';
import '../views/login.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.login,
      page: () => LoginViews(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomeViews(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfileViews(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.updateAccount,
      page: () => UpdateAccountViews(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.updatePassword,
      page: () => UpdatePasswordViews(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),

    // CATATAN::STARTED
    GetPage(
      name: RouteName.catatan,
      page: () => CatatanViews(),
      binding: CatatanBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.catatanForm,
      page: () => CatatanFormViews(),
      binding: CatatanBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.catatanShow,
      page: () => CatatanShow(),
      binding: CatatanShowBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.catatanEdit,
      page: () => CatatanEdit(),
      binding: CatatanEditBinding(),
      transition: Transition.fadeIn,
    ),
    // CATATAN::ENDED

    GetPage(
      name: RouteName.bantuan,
      page: () => BantuanViews(),
      binding: BantuanBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.absensi,
      page: () => AbsensiViews(),
      binding: AbsensiBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.pemberitahuan,
      page: () => PemberitahuanViews(),
      binding: PemberitahuanBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.izin,
      page: () => IzinViews(),
      binding: IzinBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.cuti,
      page: () => CutiViews(),
      binding: CutiBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.inventaris,
      page: () => InventarisViews(),
      binding: InventarisBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.koperasi,
      page: () => KoperasiViews(),
      binding: KoperasiBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
