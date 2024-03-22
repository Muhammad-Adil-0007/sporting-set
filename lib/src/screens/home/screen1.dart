import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sporting_set/src/utils/widgets/category.dart';
import 'package:vibration/vibration.dart';
import '../../data/sports_data.dart';
import '../../utils/widgets/match_card.dart';
import '../../utils/widgets/match_header.dart';
import 'home_controller.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff62A2DB),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height * 0.84,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/340096 1.png',
                      ))),
            ),
          ),
          Container(
            color: const Color(0xff3578B7).withOpacity(0.85),
            width: Get.width,
            height: Get.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Soccer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: Get.width * 0.05),
                        )),
                  ),
                  Column(
                    children: footballData.map((e) => MatchCard(height: height, width: width, data: e, controlle: controller)).toList(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
