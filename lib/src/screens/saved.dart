import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sporting_set/src/utils/widgets/match_header.dart';
import 'package:vibration/vibration.dart';
import '../data/sports_data.dart';
import '../utils/widgets/category.dart';
import '../utils/widgets/match_card.dart';
import 'home/home_controller.dart';

class Saved extends StatelessWidget {
  Saved({Key? key}) : super(key: key);

  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff3688D1),
        body: Stack(alignment: Alignment.bottomCenter, children: [
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
            height: Get.height * 0.85,
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.04),
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
                    Expanded(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: footballData.length,
                          itemBuilder: (cntx, ind) {
                            return MatchCard(
                              height: height,
                              width: width,
                              data: footballData[ind],
                              saved: true,
                              controlle: controller,
                              savedScreen: true,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
