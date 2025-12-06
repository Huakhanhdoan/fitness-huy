import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/color_constants.dart';
import '../../history/views/history_view.dart';
import '../../home/views/home_view.dart';
import '../../map/views/map_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    // List of pages for bottom navigation (4 tabs)
    final List<Widget> pages = [
      const HomeView(),
      const HistoryView(),
      const MapView(),
      const ProfileView(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Main content area
          Obx(() => Container(
                color: Colors.white,
                child: pages[controller.currentIndex],
              )),

          // Top bar and bottom navigation
          Column(
            children: [
              // Custom top bar
              Container(
                height: 90,
                decoration: const BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            controller.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )),
                      IconButton(
                        onPressed: () {
                          // Navigate to settings page
                          // TODO: Implement navigation to settings
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Curved navigation bar with 4 tabs
              Obx(() => CurvedNavigationBar(
                    index: controller.currentIndex,
                    color: ColorConstants.primaryColor,
                    backgroundColor: Colors.transparent,
                    height: 60,
                    items: const [
                      CurvedNavigationBarItem(
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      CurvedNavigationBarItem(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                    onTap: (index) {
                      controller.changeTab(index);
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
