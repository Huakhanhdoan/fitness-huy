import 'package:base_project_flutter/app/core/base/base_usecase.dart';
import 'package:base_project_flutter/app/domain/entities/user.dart';
import 'package:base_project_flutter/app/domain/repositories/auth_repository.dart';

class RegisterUseCase extends BaseUseCaseIO<RegisterParams, User> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<User> build(RegisterParams i) {
    return repository.register(i.email, i.password);
  }
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({required this.email, required this.password});
}
