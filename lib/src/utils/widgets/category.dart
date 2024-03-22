import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Categorie extends StatelessWidget {
  final String path;
  final String txt;
  final bool selected;
  final VoidCallback onTap;

  const Categorie(this.path, this.txt, this.selected, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: selected ? const Color(0xff323232) : Colors.white,
        radius: Get.width * 0.075,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.width * 0.03),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(path, color: selected ? Colors.white : const Color(0xff323232),),
                SizedBox(height: Get.width * 0.01,),
                Text(
                  txt,
                  style: TextStyle(fontSize: Get.width * 0.025, color: selected ? Colors.white : const Color(0xff323232)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
