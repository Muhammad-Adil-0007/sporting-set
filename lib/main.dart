import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sporting_set/src/routes/app_pages.dart';
import 'package:sporting_set/src/routes/app_routes.dart';
import 'package:sporting_set/src/screens/arscreen.dart';
import 'package:sporting_set/src/utils/language/translation.dart';
import 'package:sporting_set/src/utils/points_binding.dart';

void main() async{
  await GetStorage.init();
  final box = GetStorage();

  String storedString = box.read('language') ?? 'en';

  runApp(MyApp(storedString,));
}

class MyApp extends StatelessWidget {
  final String storedString;

  const MyApp(this.storedString,);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      initialBinding: PointsBinding(),
      title: 'Flutter Demo',
      translations: TranslationService(),
      locale: Locale(storedString, storedString=='ru' ? 'RU': 'US'),
      fallbackLocale: const Locale('ru', 'RU'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3578B7),),
        primaryColor: const Color(0xff3578B7),
        splashColor: const Color(0xff3578B7),
        useMaterial3: true,
      ),
      getPages: AppPages.routes,
      // initialRoute: Routes.welcome,
      home: ArMeasurementScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}