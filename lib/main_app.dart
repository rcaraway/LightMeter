import 'package:flutter/material.dart';
import 'package:light_meter/navigation.dart';
import 'package:get/get.dart';

class LightMeterApp extends StatelessWidget {
  const LightMeterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppNavigation navigation = Get.find();
    return GetMaterialApp.router(
        routeInformationParser: navigation.defaultParser,
        routerDelegate: navigation.defaultRouter,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
