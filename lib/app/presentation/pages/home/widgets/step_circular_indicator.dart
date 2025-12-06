import 'package:base_project_flutter/app/core/constants/pedometer_status.dart';
import 'package:base_project_flutter/app/presentation/pages/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepCircularIndicator extends GetView<HomeController> {
  const StepCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 23.0,
          animation: true,
          percent: controller.progressPercent,
          startAngle: 180,
          center: CircularPercentIndicator(
            radius: 90,
            lineWidth: 2,
            percent: 1,
            progressColor: Colors.orange,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Icon(
                      controller.status.value == PedometerStatus.walking
                          ? Icons.directions_walk
                          : Icons.accessibility_new,
                      size: 70,
                      color: Colors.green,
                    )),
                Obx(() => Text(
                      controller.status.value.displayName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Obx(() => Text(
                        "${controller.stepToday.value}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      )),
                ),
                const Text(
                  'Bước',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
          ),
          footer: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () => _showGoalDialog(context),
              style: ButtonStyle(
                shadowColor: WidgetStateProperty.all<Color>(Colors.grey),
                elevation: WidgetStateProperty.all<double>(5),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(Colors.green),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Text(
                      "Mục tiêu ${controller.stepGoal.value}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.green,
        ));
  }

  void _showGoalDialog(BuildContext context) {
    final TextEditingController goalController = TextEditingController(
      text: controller.stepGoal.value.toString(),
    );

    Get.dialog(
      AlertDialog(
        title: const Text('Đặt mục tiêu bước chân'),
        content: TextField(
          controller: goalController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Số bước mục tiêu',
            hintText: 'Nhập số bước',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.directions_walk),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              final newGoal = int.tryParse(goalController.text);
              if (newGoal != null && newGoal > 0) {
                controller.updateStepGoal(newGoal);
                Get.back();
                Get.snackbar(
                  'Thành công',
                  'Mục tiêu đã được cập nhật thành $newGoal bước',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );
              } else {
                Get.snackbar(
                  'Lỗi',
                  'Vui lòng nhập số bước hợp lệ',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }
}
