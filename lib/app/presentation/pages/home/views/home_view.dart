import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/step_circular_indicator.dart';
import '../widgets/stats_row.dart';
import '../widgets/total_stats_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 70),

                // Main circular progress indicator
                const StepCircularIndicator(),

                // Stats row (Calo, Khoảng cách, Thời gian)
                StatsRow(),

                // Total stats cards
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => TotalStatsCard(
                          icon: Icons.snowshoeing,
                          nameCard: "Tổng số bước",
                          unit: "Các bước",
                          value: controller.stepCount.value.toDouble(),
                          onTap: () {
                            // Navigate to statistics
                          },
                        )),
                    Obx(() => TotalStatsCard(
                          icon: Icons.local_fire_department_rounded,
                          nameCard: "Tổng lượng Calo",
                          unit: "Kcal",
                          value: controller.stepCount.value / 20,
                          onTap: () {
                            // Navigate to statistics
                          },
                        )),
                    Obx(() => TotalStatsCard(
                          icon: Icons.social_distance,
                          nameCard: "Tổng khoảng cách",
                          unit: "km",
                          value: controller.stepCount.value * 0.0008,
                          onTap: () {
                            // Navigate to statistics
                          },
                        )),
                    Obx(() => TotalStatsCard(
                          icon: Icons.timer,
                          nameCard: "Tổng thời gian",
                          unit: "phút",
                          value: controller.stepCount.value / 60,
                          onTap: () {
                            // Navigate to statistics
                          },
                        )),
                    const SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
