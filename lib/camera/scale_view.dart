import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_meter/camera/camera_state.dart';
import 'package:get/get.dart';

class ScaleView extends HookWidget {
  final provider = Get.find<CameraState>().scaleProvider;

  @override
  Widget build(BuildContext context) {
    ScaleViewState state = useProvider(provider);
    return Container(
        child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView(
                itemExtent: 20,
                controller: state.controller,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 0.20,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text('Test'),
                    ),
                  )
                ])));
  }
}
