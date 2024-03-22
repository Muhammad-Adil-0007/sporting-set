import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreContainer extends StatelessWidget {
  final double height;
  final double width;
  final dynamic data;
  final String val;

  const ScoreContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.data,
      required this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(val,
    style: TextStyle(
    color: Colors.white,
    fontSize: width * 0.033,
    fontWeight: FontWeight.bold)),
        Container(
            height: width * 0.145,
            width: width * 0.13,
            decoration: BoxDecoration(
                color: const Color(0xff88B9E4),
                borderRadius: BorderRadius.circular(5),

            ),
            child: Center(
                child: Text(data.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.033,
                        fontWeight: FontWeight.bold)))),
      ],
    );
  }
}
