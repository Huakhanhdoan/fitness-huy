import 'package:base_project_flutter/app/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> forgotPassword(String email);
  Future<User> register(String email, String password, String name);
}
