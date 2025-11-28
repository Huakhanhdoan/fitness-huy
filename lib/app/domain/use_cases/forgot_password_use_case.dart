import 'package:base_project_flutter/app/core/base/base_usecase.dart';
import 'package:base_project_flutter/app/domain/entities/user.dart';
import 'package:base_project_flutter/app/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase extends BaseUseCaseIO<ForgotPasswordParams, User> {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  @override
  Future<User> build(ForgotPasswordParams i) {
    return repository.forgotPassword(i.email);
  }
}

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({required this.email});
}
