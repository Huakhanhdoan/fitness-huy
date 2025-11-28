import 'package:base_project_flutter/app/core/error/app_exception.dart';

/// Base use with input and output
abstract class BaseUseCaseIO<I, O> {
  Future<O> build(I i);

  Future<Result<O>> execute(I i) async {
    try {
      final result = await build(i);
      return Result.success(result);
    } catch (error) {
      return Result.failure(handleError(error));
    }
  }
}

/// Base use without input
abstract class BaseUseCase<O> {
  Future<O> build();

  Future<Result<O>> execute() async {
    try {
      final result = await build();
      return Result.success(result);
    } catch (error) {
      return Result.failure(handleError(error));
    }
  }
}

/// Handle error
AppException handleError(dynamic error) {
  if (error is Exception) {
    return AppException.fromException(error);
  } else if (error is Error) {
    return AppException.fromError(error);
  } else {
    return AppException(AppExceptionType.unknown, 'Unknown error');
  }
}

/// Result class
class Result<T> {
  final T? data;
  final AppException? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => !isSuccess;
}
