import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/instance_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  Get.put(cameras.first);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraPage(),
    );
  }
}

class CameraPage extends StatelessWidget {
  late CameraController _controller;
  final CameraDescription _camera = Get.find();
  late Future<void> initializeCameraScreen;

  CameraPage({Key? key}) : super(key: key) {
    setupCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: initializeCameraScreen,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(children: [
            CameraPreview(_controller),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.20,
                ))
          ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  setupCamera() async {
    _controller = CameraController(_camera, ResolutionPreset.high);
    initializeCameraScreen = _controller.initialize();
  }
}
