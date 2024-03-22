import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  final AudioPlayer? player;
  AppLifecycleObserver({this.player});
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
      // App is in the foreground
      // Add your foreground logic here
        break;
      case AppLifecycleState.inactive:
      // App is in an inactive state (e.g., transitioning)
        break;
      case AppLifecycleState.paused:
      // App is in the background
      // Add your background logic here
        break;
      case AppLifecycleState.detached:
      // App is detached (not running)
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
  }
}

