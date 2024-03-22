import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../utils/points_controller.dart';
class Welcome extends GetView<PointsController> {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC701),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
      height:Get.height ,
      width: Get.width,
      child: Image.asset('assets/images/340096 1.png', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width+120,fit: BoxFit.cover, )),
          Container(
            color: const Color(0xff3578B7).withOpacity(0.85),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              top: Get.height * 0.3,
              child: Column(
                children: [
                  Text('Sporting Set', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.14, fontWeight: FontWeight.w600),),
                  SizedBox(height: Get.height * 0.415,),
                  GestureDetector(
                      onTap: () async{
                        if(controller.rewardCollected.value){
                          Get.offAllNamed(Routes.tabs);
                        }else{
                          Get.offAllNamed(Routes.tabs);
                        }
                      },
                      child: Container(
                        width: Get.width * 0.7,
                        height: Get.height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Get.width * 0.03),

                        ),
                          child: Center(child: Text('TAP TO START'.tr, style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.w600),)))
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
