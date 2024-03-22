import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchHeader extends StatelessWidget {
  final double height;
  final double width;
  final String? txt;
  const MatchHeader({Key? key, required this.width, required this.height, this.txt}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.035,
      color: const Color(0xff323232),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.075),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txt!=null ? txt! : 'Europe League. 1/4 final', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.03),),
            SizedBox(
              width: width * 0.28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1',style: TextStyle(color: Colors.white, fontSize: Get.width * 0.03)),
                  Text('X', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.03)),
                  Text('2', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.03))
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}
