import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_meter/camera/camera_state.dart';
import 'package:get/get.dart';

class ScaleView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useProvider(Get.find<CameraState>().provider);
    return const Center(child: Text('MONEY'));
  }
}
