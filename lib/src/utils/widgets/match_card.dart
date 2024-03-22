import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../data/sports_data.dart';
import '../../routes/app_pages.dart';
import '../../screens/home/home_controller.dart';
import '../points_controller.dart';
import 'score_container.dart';
import 'btn.dart';

class MatchCard extends GetView<PointsController> {
  final double height;
  final double width;
  final Match data;
  final bool saved;
  final HomeController controlle;
  final bool savedScreen;
  final bool oddsScreen;
  const MatchCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.data,
      this.saved = false,
      required this.controlle,
      this.savedScreen = false,
      this.oddsScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controlle.detailItem?.value = data;
        controller.vibrate();
        Get.toNamed(Routes.screenTwo);
      },
      child: Container(
        height: height * 0.14,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            color: Color(0xff62A2DB)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Get.width * 0.41,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data.team1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.034,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                )),
                            Text(data.team1Goal.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.034,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: width * 0.015,
                      ),
                      Container(
                        width: Get.width * 0.41,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data.team2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.034,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                )),
                            Text(data.team2Goal.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.034,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: width * 0.025,
                      ),
                      Text(
                        'Live',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.033,
                        ),
                      ),
                      SizedBox(
                        height: width * 0.025,
                      ),
                    ],
                  ),
                  // Positioned(
                  //     right: width * 0.28,
                  //     child: Visibility(
                  //         visible: saved,
                  //         child: SvgPicture.asset(
                  //           'assets/images/save.svg',
                  //           height: height * 0.03,
                  //         )))
                ],
              ),
            ),
            (savedScreen || oddsScreen)
                ? Container(
                    width: width * 0.45,
                    height: Get.height * 0.152,
                    padding: EdgeInsets.only(top: height * 0.035),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.status?.toUpperCase() ?? "",
                          style: TextStyle(
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: data.status=='lose' ? Colors.red : data.status=='win' ? Colors.greenAccent : Colors.amberAccent,
                          ),
                        ),
                        SizedBox(width: Get.width * 0.04,),
                        Visibility(
                          visible: oddsScreen,
                          child: Text(
                            data.odd! ? 'ODD WINS' : 'ODD LOSE',
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: data.odd! ? Colors.greenAccent : Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    width: width * 0.45,
                    height: Get.height * 0.152,
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ScoreContainer(
                          height: height,
                          width: width,
                          data: data.odd1,
                          val: '1',
                        ),
                        ScoreContainer(
                          height: height,
                          width: width,
                          data: data.oddX,
                          val: 'x',
                        ),
                        ScoreContainer(
                            height: height,
                            width: width,
                            data: data.odd2,
                            val: '2'),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
