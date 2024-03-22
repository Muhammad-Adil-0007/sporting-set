import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sporting_set/src/routes/app_pages.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigate();
  }

  void _navigate()async{
    await Future.delayed(const Duration(milliseconds: 1500),(){
      Get.offAllNamed(Routes.tabs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC701),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // SvgPicture.asset('assets/images/background.svg', height: Get.height,),
          Image.asset('assets/images/myb.png', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width+120,),
          Container(
            color: const Color(0xffFFC701).withOpacity(0.85),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              top: Get.height * 0.3,
              child: Column(
                children: [
                  Text('DAILY BONUS', style: TextStyle(fontSize: Get.width * 0.14, fontWeight: FontWeight.w600),),
                  Text('+300 POINTS',  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.w600, height: Get.width * 0.003),),
                  SizedBox(height: Get.height * 0.215,),
                  // GestureDetector(
                  //     onTap: () async{
                  //       await GetStorage.init();
                  //       final box = GetStorage();
                  //       DateTime currentDate = DateTime.now();
                  //       dynamic storedValue = box.read('point');
                  //       int point;
                  //       if (storedValue is int) {
                  //         point = storedValue;
                  //       } else if (storedValue is String) {
                  //         point = int.tryParse(storedValue) ?? 0;
                  //       } else {
                  //         point = 0;
                  //       }
                  //       box.write('date', currentDate.toString());
                  //       box.write('point', (point+300));
                  //       PointsController controller = Get.find<PointsController>();
                  //       controller.points.value = controller.points.value + 300;
                  //       Get.offAllNamed(Routes.tabs);
                  //     },
                  //     child: Text('TAP TO CLAIM', style: TextStyle(fontSize: Get.width * 0.05, fontWeight: FontWeight.w600),)
                  // )
                ],
              )
          ),
        ],
      ),
    );
  }
}
