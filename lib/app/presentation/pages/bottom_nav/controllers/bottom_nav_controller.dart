import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Observable index for current tab
  final _currentIndex = 0.obs;

  // Observable title for app bar
  final _title = 'TRANG CHỦ'.obs;

  // Getters
  int get currentIndex => _currentIndex.value;
  String get title => _title.value;

  @override
  void onInit() {
    super.onInit();
    // Check if an initial index was passed as argument
    final args = Get.arguments;
    if (args != null && args is int) {
      changeTab(args);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Change the current tab and update the title
  void changeTab(int index) {
    _currentIndex.value = index;
    _updateTitle(index);
  }

  /// Update title based on the selected tab
  void _updateTitle(int index) {
    switch (index) {
      case 0:
        _title.value = 'TRANG CHỦ';
        break;
      case 1:
        _title.value = 'LỊCH SỬ';
        break;
      case 2:
        _title.value = 'LỘ TRÌNH';
        break;
      case 3:
        _title.value = 'HỒ SƠ';
        break;
      default:
        _title.value = 'Lỗi';
    }
  }
}
