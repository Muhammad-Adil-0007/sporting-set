import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sporting_set/src/screens/home/screen1.dart';
import 'package:sporting_set/src/screens/odds.dart';
import 'package:sporting_set/src/screens/saved.dart';
import 'package:sporting_set/src/screens/screen4.dart';

class TabsController extends GetxController{
  RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    ScreenOne(),
     Saved(),
     Odds(),
    const ScreenFour()
  ];
}