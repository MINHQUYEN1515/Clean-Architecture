import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/auth/domain/entities/user.dart';
import 'package:language_app/features/auth/domain/repositories/auth_repository.dart';

class Login {
  Login(this._repository);

  final AuthRepository _repository;

  Future<({Failure? failure, User? user})> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}
