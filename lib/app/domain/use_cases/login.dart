import 'package:base_project_flutter/app/core/base/base_usecase.dart';
import 'package:base_project_flutter/app/domain/entities/user.dart';
import 'package:base_project_flutter/app/domain/repositories/auth_repository.dart';

class LoginUseCase extends BaseUseCaseIO<LoginParams, User> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<User> build(LoginParams i) {
    return repository.signInWithEmailAndPassword(i.email, i.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
