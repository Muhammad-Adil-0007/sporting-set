import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/points_controller.dart';
import '../utils/widgets/myappbar.dart';
import 'home/home_controller.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({super.key});
  PointsController controller = Get.find<PointsController>();
  HomeController homeCntrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3578B7),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.08),
        child: MyAppBar(),
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Positioned(
          bottom: 0,
          child: Container(
            height: Get.height * 0.9,
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
          height: Get.height * 0.9,
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${homeCntrl.detailItem?.value?.team1} vs ${homeCntrl.detailItem?.value?.team2}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.width * 0.05),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    height: Get.height * 0.22,
                    color: const Color(0xff62A2DB),
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08, vertical: Get.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/images/team2.png', height: Get.width * 0.2, width: Get.width * 0.2,),
                            SizedBox(height: Get.width * 0.05,),
                            Text('${homeCntrl.detailItem?.value?.team1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                         Column(
                          children: [
                            const Text('IN GAME', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            SizedBox(height: Get.width * 0.07,),
                            Text('${homeCntrl.detailItem?.value?.team1Goal.toString()} : ${homeCntrl.detailItem?.value?.team2Goal.toString()}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Get.width * 0.1),),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/images/team1.png', height: Get.width * 0.2, width: Get.width * 0.2,),
                            SizedBox(height: Get.width * 0.05,),
                            Text('${homeCntrl.detailItem?.value?.team2}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.width * 0.07,),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: ()async{
                        controller.vibrate();
                        final box = GetStorage();
                        homeCntrl.selectedCatDataOdds.value.add(homeCntrl.detailItem!.value!);
                        final jsonData = homeCntrl.selectedCatDataOdds.value.map((match) => match.toMap()).toList();
                        await box.write('savedOdds', jsonData);
                        print('saved');
                      },
                      child: Container(
                        height: Get.height * 0.08,
                        width: Get.width * 0.5,
                        color: const Color(0xff3688D1),
                        child: Center(
                          child: Text(
                            'Make Prediction',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Get.width * 0.04
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05,),
                  textRow(homeCntrl.detailItem!.value!.possession!, 'POSSESSION'.tr, homeCntrl.detailItem!.value!.possession2!),
                  textRow(homeCntrl.detailItem!.value!.shots!, 'Shots'.tr.toUpperCase(), homeCntrl.detailItem!.value!.shots2!),
                  textRow(homeCntrl.detailItem!.value!.onTarget!, 'Shots on target'.tr.toUpperCase(), homeCntrl.detailItem!.value!.onTarget2!),
                  textRow(homeCntrl.detailItem!.value!.scr!, 'Shot conversion rate'.tr.toUpperCase(), homeCntrl.detailItem!.value!.scr2!),
                  textRow(homeCntrl.detailItem!.value!.corners!, 'Corners'.tr.toUpperCase(), homeCntrl.detailItem!.value!.corners2!),
                  textRow(homeCntrl.detailItem!.value!.ins!, 'throw ins'.tr.toUpperCase(), homeCntrl.detailItem!.value!.ins2!),
                  textRow(homeCntrl.detailItem!.value!.saves!, 'saves'.tr.toUpperCase(), homeCntrl.detailItem!.value!.saves2!),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.width * 0.06,
          left: Get.width * 0.03,
          child: GestureDetector(
            onTap: (){
              controller.vibrate();
              Get.back();
            },
            child: CircleAvatar(
              radius: Get.width * 0.04,
              backgroundColor: Colors.white,
              child: Center(child: Icon(Icons.arrow_left_sharp, size: Get.width * 0.08,)),
            ),
          ),),
      ]),
    );
  }

  Widget textRow(int val1, String title, int val2) {
    double left = val1/(val1+val2) * 100;
    double right = val2/(val1+val2) * 100;
    return Padding(
      padding:  EdgeInsets.only(bottom: Get.width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: Get.width * 0.03, ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(val1.toString(), style: TextStyle(color: Colors.white, fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),),
              SizedBox(width:Get.width * 0.04),
              Container(
                height: Get.width * 0.035,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Expanded(
                         flex: 1,
                         child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Container(
                           height: Get.width * 0.035,
                           width: (Get.width * 0.3) * (right/100),
                           decoration: const BoxDecoration(
                             color: Color(0xff3688D1),
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(16.0),  // Adjust the radius as needed
                               bottomLeft: Radius.circular(16.0),  // Adjust the radius as needed
                             ),
                           )
                         )
                     ],),
                     ),
                    Expanded(flex: 1,child: Row(
                      children: [
                        Container(
                            height: Get.width * 0.035,
                            width: (Get.width * 0.3) * (left/100),
                            decoration: const BoxDecoration(
                              color: Color(0xff3688D1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),  // Adjust the radius as needed
                                bottomRight: Radius.circular(16.0),  // Adjust the radius as needed
                              ),
                            )
                        ),
                      ],
                    )
                    ,)
                  ],
                ),
              ),
              SizedBox(width:Get.width * 0.04),
              Text(val2.toString(), style: TextStyle(color: Colors.white, fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }

}

// SingleChildScrollView(
// child: Column(
// children: [
// Container(
// padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
// height: Get.height * 0.06,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// GestureDetector(
// child: Image.asset(
// 'assets/images/del.png',
// width: Get.width * 0.08,
// height: Get.width * 0.07,
// fit: BoxFit.contain,
// ),
// onTap: () {
// controller.vibrate();
// Get.back();
// },
// ),
// GestureDetector(
// child: Image.asset(
// 'assets/images/save.png',
// width: Get.width * 0.08,
// height: Get.width * 0.06,
// fit: BoxFit.contain,
// ),
// onTap: () async {
// controller.vibrate();
// try {
// await GetStorage.init();
// final box = GetStorage();
// String cat = homeCntrl.selectedCat.value=='basket' ? 'savedBasket' : homeCntrl.selectedCat.value=='foot' ? 'savedFoot' : 'savedHockey';
// final List<Match> previousItems =
// (box.read(cat) as List<dynamic>?)
//     ?.map((item) => Match.fromMap(item))
//     .toList() ??
// [];
// if (homeCntrl.detailItem!.value != null) {
// previousItems.add(homeCntrl.detailItem!.value!);
// if(cat=='savedBasket'){
// homeCntrl.savedMatchesBasketBall.value.add(homeCntrl.detailItem!.value!);
// homeCntrl.savedMatches.value.add(homeCntrl.detailItem!.value!);
// }
// if(cat=='savedFoot'){
// homeCntrl.savedMatchesFootball.value.add(homeCntrl.detailItem!.value!);
// homeCntrl.savedMatches.value.add(homeCntrl.detailItem!.value!);
// }
// if(cat=='savedHockey'){
// homeCntrl.savedMatchesHockey.value.add(homeCntrl.detailItem!.value!);
// homeCntrl.savedMatches.value.add(homeCntrl.detailItem!.value!);
// }
// }
//
// final previousItemsAsMaps = previousItems
//     .map((item) => item.toMap())
//     .toList();
//
// box.write(cat, previousItemsAsMaps);
//
// } catch (e) {
// }
// }),
// ],
// ),
// ),
// Container(
// height: Get.height * 0.04,
// color: const Color(0xff323232),
// child: Padding(
// padding: EdgeInsets.only(
// left: Get.width * 0.05, right: Get.width * 0.075),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// '${homeCntrl.detailItem!.value!.team1} vs ${homeCntrl.detailItem!.value!.team2}',
// style: const TextStyle(color: Colors.white),
// ),
// ],
// ),
// ),
// ),
// SizedBox(
// height: Get.height * 0.01,
// ),
// SizedBox(
// height: Get.height * 0.32,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// children: [
// Image.asset(
// 'assets/images/team2.png',
// width: Get.width * 0.2,
// height: Get.height * 0.1,
// fit: BoxFit.contain,
// ),
// SizedBox(
// height: Get.height * 0.007,
// ),
// Text(
// homeCntrl.detailItem!.value!.team1.substring(0,homeCntrl.detailItem!.value!.team1.length > 11 ? 11: homeCntrl.detailItem!.value!.team1.length),
// style: TextStyle(
// fontSize: Get.height * 0.025,
// fontWeight: FontWeight.w800),
// ),
// SizedBox(
// height: Get.height * 0.007,
// ),
// Text(
// homeCntrl.detailItem!.value!.team1Goal.toString(),
// style: TextStyle(
// fontSize: Get.height * 0.025,
// fontWeight: FontWeight.w800),
// ),
// SizedBox(
// height: Get.height * 0.007,
// ),
// scoreContainer(homeCntrl.detailItem!.value!.odd1)
// ],
// ),
// Column(
// children: [
// SizedBox(
// height: Get.height * 0.05,
// ),
// Column(
// children: [
// Text(
// homeCntrl.detailItem!.value!.time,
// style: TextStyle(
// fontSize: Get.height * 0.015,
// fontWeight: FontWeight.w800),
// ),
// Text(
// 'Live'.tr,
// style: TextStyle(
// fontSize: Get.height * 0.015,
// fontWeight: FontWeight.w800),
// ),
// ],
// ),
// SizedBox(
// height: Get.height * 0.055,
// ),
// Text(
// ':',
// style: TextStyle(
// fontSize: Get.height * 0.025,
// fontWeight: FontWeight.w800),
// ),
// SizedBox(
// height: Get.height * 0.01,
// ),
// scoreContainer(homeCntrl.detailItem!.value!.oddX)
// ],
// ),
// Column(
// children: [
// Image.asset(
// 'assets/images/team1.png',
// width: Get.width * 0.2,
// height: Get.height * 0.1,
// fit: BoxFit.contain,
// ),
// SizedBox(
// height: Get.height * 0.007,
// ),
// Text(
// homeCntrl.detailItem!.value!.team2.substring(0,homeCntrl.detailItem!.value!.team2.length > 11 ? 11: homeCntrl.detailItem!.value!.team2.length) ,
// style: TextStyle(
// fontSize: Get.height * 0.025,
// fontWeight: FontWeight.w800),
// ),
// SizedBox(
// height: Get.height * 0.007,
// ),
// Text(
// homeCntrl.detailItem!.value!.team2Goal.toString(),
// style: TextStyle(
// fontSize: Get.height * 0.025,
// fontWeight: FontWeight.w800),
// ),
// SizedBox(
// height: Get.height * 0.007,
// ),
// scoreContainer(homeCntrl.detailItem!.value!.odd2)
// ],
// ),
// ],
// ),
// ),
// SizedBox(
// width: Get.width,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// SizedBox(
// width: Get.width * 0.56,
// height: Get.height * 0.06,
// child: Center(
// child: TextField(
// textAlign: TextAlign.center,
// controller: controller.textController,
// decoration: InputDecoration(
// contentPadding: EdgeInsets.zero,
// focusedBorder: const OutlineInputBorder(
// borderSide:
// BorderSide(color: Colors.black, width: 1.0),
// borderRadius: BorderRadius.zero,
// ),
// enabledBorder: const OutlineInputBorder(
// borderSide:
// BorderSide(color: Colors.black, width: 1.0),
// borderRadius: BorderRadius.zero,
// ),
// fillColor: Colors.black.withOpacity(0.3),
// filled: true,
// ),
// ),
// ),
// ),
// SizedBox(height: Get.height * 0.01),
// GestureDetector(
// onTap: () {
// controller.vibrate();
// controller.makePrediction(homeCntrl.detailItem?.value);
// },
// child: Container(
// width: Get.width * 0.56,
// height: Get.height * 0.06,
// color: const Color(0xff323232),
// child: Center(
// child: Text(
// 'Make Prediction'.tr,
// style: TextStyle(
// fontSize: Get.width * 0.033,
// color: Colors.white),
// ),
// ),
// ),
// ),
// SizedBox(
// height: Get.width * 0.04,
// ),
// textRow(homeCntrl.detailItem!.value!.possession!, 'POSSESSION'.tr, homeCntrl.detailItem!.value!.possession!),
// textRow(homeCntrl.detailItem!.value!.shots!, 'Shots'.tr.toUpperCase(), homeCntrl.detailItem!.value!.shots!),
// textRow(homeCntrl.detailItem!.value!.onTarget!, 'Shots on target'.tr.toUpperCase(), homeCntrl.detailItem!.value!.onTarget!),
// textRow(homeCntrl.detailItem!.value!.scr!, 'Shot conversion rate'.tr.toUpperCase(), homeCntrl.detailItem!.value!.scr!),
// textRow(homeCntrl.detailItem!.value!.corners!, 'Corners'.tr.toUpperCase(), homeCntrl.detailItem!.value!.corners!),
// textRow(homeCntrl.detailItem!.value!.ins!, 'throw ins'.tr.toUpperCase(), homeCntrl.detailItem!.value!.ins!),
// textRow(homeCntrl.detailItem!.value!.saves!, 'saves'.tr.toUpperCase(), homeCntrl.detailItem!.value!.saves!),
// ],
// ),
// )
// ],
// ),
// ),
