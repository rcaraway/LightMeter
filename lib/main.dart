import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:light_meter/app_state.dart';
import 'package:light_meter/main_app.dart';
import 'package:light_meter/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _injectDependencies();
  runApp(const ProviderScope(child: LightMeterApp()));
}

Future<void> _injectDependencies() async {
  final cameras = await availableCameras();
  if (cameras.isNotEmpty) {
    Get.put(cameras.first);
  }
  Get.put(AppNavigation());
  Get.put(AppState());
}
