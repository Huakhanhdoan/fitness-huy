import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BottomNavView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
