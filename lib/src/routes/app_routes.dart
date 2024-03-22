
import 'package:sporting_set/src/screens/screen2.dart';
import 'package:sporting_set/src/screens/tabs/tabscreen.dart';
import 'package:sporting_set/src/screens/welcome.dart';

import 'app_pages.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: Paths.tabs, page: () => Tabs(),),
    GetPage(name: Paths.welcome, page: () => const Welcome(),),
    GetPage(name: Paths.screenTwo, page: () => ScreenTwo(),),
  ];
}