import 'dart:async';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/pedometer_status.dart';

class HomeController extends GetxController {
  // Observables for step counter
  final stepCount = 0.obs;
  final stepToday = 0.obs;
  final stepGoal = 50000.obs;
  final status = PedometerStatus.stopped.obs;
  final calories = 0.0.obs;
  final distance = 0.0.obs;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _lastUpdate = '';

  StreamSubscription<StepCount>? _stepCountSubscription;
  StreamSubscription<PedestrianStatus>? _pedestrianStatusSubscription;

  @override
  void onInit() {
    super.onInit();
    _requestPermission();
    _loadLastUpdate();
  }

  @override
  void onClose() {
    _stepCountSubscription?.cancel();
    _pedestrianStatusSubscription?.cancel();
    super.onClose();
  }

  Future<void> _requestPermission() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _initPlatformState();
    }
  }

  void _initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusSubscription = _pedestrianStatusStream.listen(
      _onPedestrianStatusChanged,
      onError: _onPedestrianStatusError,
    );

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountSubscription = _stepCountStream.listen(
      _onStepCount,
      onError: _onStepCountError,
    );
  }

  void _onPedestrianStatusChanged(PedestrianStatus event) {
    status.value = PedometerStatus.fromString(event.status);
  }

  void _onPedestrianStatusError(dynamic error) {
    status.value = PedometerStatus.unknown;
  }

  Future<void> _onStepCount(StepCount event) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    stepCount.value = event.steps;

    // Check if date changed
    if (_lastUpdate != DateTime.now().toString().substring(0, 10)) {
      List<String> list = prefs.getStringList('listStep') ?? [];
      list.add(stepCount.value.toString());
      prefs.setStringList('listStep', list);
      prefs.setInt('sumStep', stepCount.value);
      _saveLastUpdate();
    }

    stepToday.value = event.steps - (prefs.getInt('sumStep') ?? 0);

    // Calculate calories and distance
    _calculateMetrics();
  }

  void _calculateMetrics() {
    // Calculate calories burned
    double weight = 70; // Weight in kg
    double stepLength = 0.8; // Step length in meters
    double speed = 100 * stepLength / 60; // Speed in m/s
    double height = 1.7; // Height in meters
    double mins = (stepToday.value / 100); // Minutes walked

    double caloriesBurned =
        mins * ((0.035 * weight) + ((speed * speed) / height) * 0.029 * weight);
    calories.value = double.parse(caloriesBurned.toStringAsFixed(2));

    // Calculate distance
    double distanceKm = stepToday.value * 0.0008;
    distance.value = double.parse(distanceKm.toStringAsFixed(2));
  }

  void _onStepCountError(dynamic error) {
    stepCount.value = -1;
  }

  Future<void> _loadLastUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    stepGoal.value = prefs.getInt('userTarget') ?? 1500;

    if (prefs.getString('lastUpdate') == null) {
      _saveLastUpdate();
    }
    _lastUpdate = prefs.getString('lastUpdate') ??
        DateTime.now().toString().substring(0, 10);
  }

  Future<void> _saveLastUpdate() async {
    String now = DateTime.now().toString().substring(0, 10);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastUpdate', now);
    _lastUpdate = now;
  }

  double get progressPercent {
    if (stepToday.value < stepGoal.value && stepToday.value >= 0) {
      return stepToday.value / stepGoal.value;
    }
    return 1.0;
  }

  int get timeMinutes => stepToday.value ~/ 60;

  Future<void> updateStepGoal(int newGoal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userTarget', newGoal);
    stepGoal.value = newGoal;
  }
}
