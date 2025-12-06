import 'package:base_project_flutter/app/presentation/pages/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsRow extends GetView<HomeController> {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 80, width: 1, color: Colors.grey),
          Obx(() => _buildStatItem(
                context,
                icon: Icons.local_fire_department,
                iconColor: Colors.orangeAccent,
                value: controller.calories.value.toStringAsFixed(2),
                label: 'Calo',
              )),
          Container(height: 80, width: 1, color: Colors.grey),
          Obx(() => _buildStatItem(
                context,
                icon: Icons.location_on,
                iconColor: Colors.red,
                value: '${controller.distance.value.toStringAsFixed(2)} km',
                label: 'Khoảng cách',
              )),
          Container(height: 80, width: 1, color: Colors.grey),
          Obx(() => _buildStatItem(
                context,
                icon: Icons.timer,
                iconColor: Colors.blue,
                value: '${controller.timeMinutes}p',
                label: 'Thời gian',
              )),
          Container(height: 80, width: 1, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 - 4,
      child: Column(
        children: [
          Icon(icon, size: 45, color: iconColor),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      ),
    );
  }
}
