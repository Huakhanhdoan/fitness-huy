import 'package:base_project_flutter/app/data/repositories/auth_repository_impl.dart';
import 'package:base_project_flutter/app/data/data_source/remote/firebase_auth_service.dart';
import 'package:base_project_flutter/app/domain/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Binding services
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService());
    // Binding repositories
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(authService: Get.find()));
  }
}
