import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/points_controller.dart';

class ScreenFour extends GetView<PointsController> {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFC701),
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
                            'Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * 0.05),
                          )),
                    ),
                    Container(
                      height: Get.height * 0.3,
                      color: const Color(0xff3688D1),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05),
                            height: Get.height * 0.1,
                            child: Row(
                              children: [
                                Obx(() => btn('english'.tr, () async {
                                      controller.vibrate();
                                      controller.english.value = true;
                                      final box = GetStorage();
                                      await box.write('language', 'en');
                                      Get.updateLocale(const Locale('en', 'US'));
                                    }, controller.english.value)),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Obx(() => btn('russian'.tr, () async {
                                      controller.vibrate();
                                      controller.english.value = false;
                                      final box = GetStorage();
                                      await box.write('language', 'ru');
                                      Get.updateLocale(const Locale('ru', 'RU'));
                                    }, !controller.english.value))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05),
                            height: Get.height * 0.1,
                            child: Row(
                              children: [
                                Obx(() => btn('on'.tr, () async {
                                      controller.vibrate();
                                      final box = GetStorage();
                                      box.write('audio', true);
                                      controller.playAudio();
                                      controller.audioEnabled.value = true;
                                    }, controller.audioEnabled.value)),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Obx(() => btn('off'.tr, () {
                                      controller.vibrate();
                                      final box = GetStorage();
                                      box.write('audio', false);
                                      controller.stopAudio();
                                      controller.audioEnabled.value = false;
                                    }, !controller.audioEnabled.value))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05),
                            height: Get.height * 0.1,
                            child: Row(
                              children: [
                                Obx(
                                  () => btn('on'.tr, () {
                                    controller.vibrate();
                                    final box = GetStorage();
                                    box.write('vibration', true);
                                    controller.vibrationEnabled.value = true;
                                    controller.vibrate();
                                  }, controller.vibrationEnabled.value),
                                ),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Obx(() => btn('off'.tr, () {
                                      controller.vibrate();
                                      final box = GetStorage();
                                      box.write('vibration', false);
                                      controller.vibrationEnabled.value = false;
                                    }, !controller.vibrationEnabled.value))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }

  Widget btn(String txt, onPress, enabled) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: enabled ? Colors.white : const Color(0xffC7C7C7),
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.055, vertical: Get.width * 0.015),
        child: Text(
          txt,
          style: TextStyle(
              fontSize: Get.width * 0.035,
              color: enabled ? const Color(0xff3688D1) : Colors.white),
        ),
      ),
    );
  }
}
