import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double lightMeasurementNone = -1;

class CameraPageState {
  final double lightMeasurement;
  final bool isCalculating;
  CameraPageState(this.lightMeasurement, this.isCalculating);
}

class ScaleViewState {
  final ScrollController controller;
  final int totalCount;
  int currentIndex;

  ScaleViewState(this.controller,
      {required this.totalCount, this.currentIndex = 0});
}

class ScaleViewStateNotifier extends StateNotifier<ScaleViewState> {
  ScaleViewStateNotifier(ScaleViewState state) : super(state);
}

class CameraStateNotifier extends StateNotifier<CameraPageState> {
  CameraStateNotifier(CameraPageState state) : super(state);
}

class CameraState {
  final StateNotifierProvider<CameraStateNotifier, CameraPageState> provider =
      StateNotifierProvider<CameraStateNotifier, CameraPageState>((ref) {
    return CameraStateNotifier(CameraPageState(lightMeasurementNone, false));
  });

  final StateNotifierProvider<ScaleViewStateNotifier, ScaleViewState>
      scaleProvider =
      StateNotifierProvider<ScaleViewStateNotifier, ScaleViewState>((ref) {
    ScrollController controller = ScrollController();
    return ScaleViewStateNotifier(
        ScaleViewState(controller, totalCount: 100, currentIndex: 0));
  });

  CameraState();
}
