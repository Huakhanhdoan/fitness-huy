import 'package:base_project_flutter/app/data/data_source/remote/firebase_auth_service.dart';
import 'package:base_project_flutter/app/domain/entities/user.dart';
import 'package:base_project_flutter/app/domain/repositories/auth_repository.dart';

// Fetch data from data source: API or Database local
class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService authService;
  AuthRepositoryImpl({required this.authService});

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final user = await authService.login(email, password);
    // Map Firebase User to your User entity
    return User(
      id: user?.uid ?? '',
      name: user?.displayName ?? '',
      email: user?.email ?? '',
      password: '',
    );
  }

  @override
  Future<User> register(String email, String password) async {
    final user = await authService.register(email, password);
    return User(
      id: user?.uid ?? '',
      name: user?.displayName ?? '',
      email: user?.email ?? '',
      password: '',
    );
  }

  @override
  Future<User> forgotPassword(String email) async {
    await authService.forgotPassword(email);
    return User(id: '', name: '', email: email, password: '');
  }
}
