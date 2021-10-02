import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStateNotifier<String> extends StateNotifier {
  AppStateNotifier(String state) : super(state);
}

class AppState {}
