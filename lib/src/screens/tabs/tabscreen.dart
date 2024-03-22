import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sporting_set/src/screens/tabs/tabs_controller.dart';
import 'package:sporting_set/src/utils/widgets/myappbar.dart';

class Tabs extends StatelessWidget {
  TabsController controller = Get.put(TabsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.08),
        child: MyAppBar(),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            // selectedLabelStyle: TextStyle(color: const Color(0xffFFC701), fontSize: Get.width * 0.03),
            // unselectedLabelStyle: TextStyle(color: const Color(0xff5F5F5F), fontSize: Get.width * 0.03),
            selectedItemColor:  Colors.white,
            unselectedItemColor: const Color(0xffB8DCFF),
            selectedFontSize: Get.width * 0.03,
            unselectedFontSize: Get.width * 0.03,
            onTap: (int index) {
              controller.currentIndex.value = index;
            },
            backgroundColor: const Color(0xff3688D1),
            items: [
              BottomNavigationBarItem(
                icon: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: Get.width * 0.025,
                        backgroundColor: controller.currentIndex.value == 0
                            ? Colors.white
                            : const Color(0xffB8DCFF),
                        child: Center(child: Icon(Icons.play_arrow, size: Get.width * 0.037,color: const Color(0xff3688D1),)),
                      ),
                      SizedBox(width:Get.width * 0.005),
                      Text('Live', style: TextStyle(color:controller.currentIndex.value == 0
                          ? Colors.white
                          : const Color(0xffB8DCFF), fontSize: Get.width * 0.03),)
                    ],
                  )
                  //     SvgPicture.asset(
                  //   'assets/images/Group (1).svg',
                  //   height: MediaQuery.of(context).size.width * 0.08,
                  //   colorFilter: ColorFilter.mode(
                  //       controller.currentIndex.value == 0
                  //           ? Colors.transparent
                  //           : const Color(0xffB8DCFF),
                  //       BlendMode.srcIn),
                  // ),
                ),
                label: 'Live'.tr,
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => SvgPicture.asset(
                    'assets/images/Layer 2 (1).svg',
                    height: MediaQuery.of(context).size.width * 0.06,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex.value == 1
                            ? Colors.white
                            : const Color(0xffB8DCFF),
                        BlendMode.srcIn),
                  ),
                ),
                label: 'Results'.tr,
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => SvgPicture.asset(
                    'assets/images/Vector (3).svg',
                    height: MediaQuery.of(context).size.width * 0.045,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex.value == 2
                            ? Colors.white
                            : const Color(0xffB8DCFF),
                        BlendMode.srcIn),
                  ),
                ),
                label: 'Odds'.tr,
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => SvgPicture.asset(
                    'assets/images/Vector (2).svg',
                    height: MediaQuery.of(context).size.width * 0.06,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex.value == 3
                            ? Colors.white
                            : const Color(0xffB8DCFF),
                        BlendMode.srcIn),
                  ),
                ),
                label: 'Settings'.tr,
              ),
            ],
          )
      ),
      body: Obx(
        () => controller.pages[controller.currentIndex.value],
      ),
    );
  }
}
