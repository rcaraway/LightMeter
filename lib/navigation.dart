import 'package:get/get.dart';
import 'package:light_meter/camera/camera_page.dart';

class Routes {
  static const defaultRoute = '/';
  static const aboutRoute = '/about';
}

class AppNavigation {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.defaultRoute,
      page: () => CameraPage(),
    )
  ];
}
