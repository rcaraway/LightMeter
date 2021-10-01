import 'package:hooks_riverpod/hooks_riverpod.dart';

const double LIGHT_MEASUREMENT_NONE = -1;

class CameraPageState {
  final double lightMeasurement;
  final bool isCalculating;
  CameraPageState(this.lightMeasurement, this.isCalculating);
}

class CameraStateNotifier extends StateNotifier<CameraPageState> {
  CameraStateNotifier(CameraPageState state) : super(state);
}

class CameraState {
  final StateNotifierProvider<CameraStateNotifier, CameraPageState> provider =
      StateNotifierProvider<CameraStateNotifier, CameraPageState>((ref) {
    return CameraStateNotifier(CameraPageState(LIGHT_MEASUREMENT_NONE, false));
  });

  CameraState();
}
