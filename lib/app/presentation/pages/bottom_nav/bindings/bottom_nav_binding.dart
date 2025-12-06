import 'package:base_project_flutter/app/presentation/pages/history/controllers/history_controller.dart';
import 'package:base_project_flutter/app/presentation/pages/home/controllers/home_controller.dart';
import 'package:base_project_flutter/app/presentation/pages/map/controllers/map_controller.dart';
import 'package:base_project_flutter/app/presentation/pages/profile/controllers/profile_controller.dart';
import 'package:get/get.dart' as getx;

import '../controllers/bottom_nav_controller.dart';

class BottomNavBinding extends getx.Bindings {
  @override
  void dependencies() {
    getx.Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
    );

    // Inject all tab controllers
    getx.Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    getx.Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
    getx.Get.lazyPut<MapController>(
      () => MapController(),
    );
    getx.Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
