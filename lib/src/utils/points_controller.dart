import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:vibration/vibration.dart';
import '../data/sports_data.dart';


class PointsController extends GetxController{

  RxInt points = 0.obs;
  RxInt? countDownVal = 10.obs;
  RxBool audioEnabled = false.obs;
  RxBool showTimer = false.obs;
  RxBool vibrationEnabled = false.obs;
  RxBool rewardCollected = false.obs;
  RxBool english = false.obs;
  late StreamSubscription<FGBGType> subscription;
  TextEditingController textController = TextEditingController();
  late AudioPlayer _player;
  String txt = '';

  @override
  void onInit() {
    super.onInit();

    checkUserPreferences();

    // checkReward();

    listen();

    getData();
  }

  void checkReward()async{
    await GetStorage.init();
    final box = GetStorage();
    DateTime currentDate = DateTime.now();
    DateTime previousDate = currentDate.subtract(const Duration(days: 1));
    String storedDate = box.read('date') ?? previousDate.toString();
    DateTime parsed = DateTime.parse(storedDate);
    bool collected = false;

    if(parsed.day==currentDate.day){
      collected=true;
    }

    rewardCollected.value = collected;

  }

  checkUserPreferences()async{
    await GetStorage.init();
    final box = GetStorage();

    audioEnabled.value = box.read('audio') ?? true;

    vibrationEnabled.value = box.read('vibration') ?? true;

    String val  = box.read('language') ?? 'en';

    english.value = val=='ru' ? false : true;

    initializeAudio();
  }

  void listen(){
    subscription = FGBGEvents.stream.listen((event) {
      if(event==FGBGType.background){
        _player.pause();
      }
      if(event==FGBGType.foreground){
        if(audioEnabled.value){
          _player.play();
        }
      }
    });
  }

  initializeAudio(){
    _player = AudioPlayer()..setAsset('assets/audio/sport4u.mp3');
    _player.setLoopMode(LoopMode.one);
    if(audioEnabled.value){
      playAudio();
    }
  }

  playAudio(){
    if(!_player.playing){
     _player.play();
   }
  }

  stopAudio(){
    if(_player.playing){
      _player.stop();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    subscription.cancel();
    super.dispose();
  }

  void getData() async{
    await GetStorage.init();
    final box = GetStorage();
    dynamic storedValue = box.read('point');
    int point;
    if (storedValue is int) {
      point = storedValue;
    } else if (storedValue is String) {
      point = int.tryParse(storedValue) ?? 0;
    } else {
      point = 0;
    }
    points.value = point;
    print(points.value);
  }

  void makePrediction(Match? data)async{
    if(data?.odd1.toString() == textController.text || data?.odd2.toString() == textController.text || data?.oddX.toString() == textController.text){
      if(points.value>=50){
        // Get.snackbar(
        //     "Success",
        //     "Your prediction is created successfully",
        //     backgroundColor: const Color(0xffFFC701).withOpacity(0.9)
        // );
        points.value = points.value - 50;
        await GetStorage.init();
        final box = GetStorage();
        box.write('point', points.value);
        txt = textController.text;
        showTimer.value = true;
        countdown();
        textController.clear();
      }else{
        Get.snackbar('Insufficient points', 'Your points are not enough to make prediction', backgroundColor: const Color(0xffFFC701).withOpacity(0.5));
      }
    }else{
      Get.snackbar(
          'Invalid entry',
          'Please enter correct value',
          backgroundColor: const Color(0xffFFC701).withOpacity(0.5)
      );
    }
  }

  void predictionResult() async{
    await GetStorage.init();
    final box = GetStorage();
    bool success = Random().nextBool();
    showTimer.value = false;
    countDownVal?.value = 10;
    if(success){
      double val = double.parse(txt);
      val = val * 50;
      points.value = (points.value + val).toInt();
      box.write('point', points.value);
    }
  }

  void countdown(){
    Future.delayed(const Duration(seconds: 1), () {
      countDownVal!.value = countDownVal!.value - 1;
      if(countDownVal!.value > 0){
        countdown();
      }else{
        predictionResult();
      }
    });
  }


  vibrate(){
    if(vibrationEnabled.value){
      Vibration.vibrate(duration: 100);
    }
  }

}