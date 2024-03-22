import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../data/sports_data.dart';
import '../../screens/home/home_controller.dart';
import '../points_controller.dart';

class Btn extends GetView<PointsController> {
  final double width;
  final Match data;
  final HomeController controller1;
  const Btn({Key? key, required this.width, required this.controller1, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        controller1.detailItem?.value = data;
        controller.vibrate();
        Get.toNamed(Routes.screenTwo);
      },
      child:Container(
        padding: EdgeInsets.symmetric(vertical: width * 0.009, horizontal: width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff323232),
        ),
        child: Text('more'.tr, style: TextStyle(color: Colors.white, fontSize: width * 0.03),),
      ),
    );
  }
}
