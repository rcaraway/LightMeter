import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_meter/camera/camera_state.dart';

class CameraPage extends HookWidget {
  late final CameraController _controller =
      CameraController(_camera, ResolutionPreset.high);
  late final Future<void> initializeCameraScreen = _controller.initialize();
  final CameraDescription _camera = Get.find();

  CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useProvider(Get.find<CameraState>().provider);

    return Scaffold(
        body: FutureBuilder(
      future: initializeCameraScreen,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(children: [
            CameraPreview(_controller),
            Center(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 2, color: Colors.white)))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.20,
                  color: Colors.transparent,
                  child: const Center(
                    child: Text('Test'),
                  ),
                ))
          ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  setupCamera() async {}
}
