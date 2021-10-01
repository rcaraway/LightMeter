import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:light_meter/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _injectDependencies();
  runApp(const MyApp());
}

Future<void> _injectDependencies() async {
  final cameras = await availableCameras();
  Get.put(cameras.first);
  Get.put(AppNavigation());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
