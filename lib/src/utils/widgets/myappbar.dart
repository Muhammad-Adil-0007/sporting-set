import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../points_controller.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key}) : super(key: key);

  PointsController controller = Get.find<PointsController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: const Color(0xff3688D1),
      leadingWidth:width * 0.3,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title:  Text('Sporting Set',
          style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.075,
              fontWeight: FontWeight.bold)),
    );
  }
}
