import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:light_meter/camera/camera_page.dart';
import 'package:light_meter/camera/camera_state.dart';

class Routes {
  static const defaultRoute = '/';
  static const aboutRoute = '/about';
}

class AppNavigation {
  RouteInformationParser<Object> get defaultParser => BeamerParser();
  RouterDelegate<Object> get defaultRouter =>
      BeamerDelegate(locationBuilder: _defaultRoutes);

  SimpleLocationBuilder get _defaultRoutes {
    return SimpleLocationBuilder(routes: {
      Routes.defaultRoute: (context, state) {
        Get.put(CameraState());
        return CameraPage();
      }
    });
  }
}
