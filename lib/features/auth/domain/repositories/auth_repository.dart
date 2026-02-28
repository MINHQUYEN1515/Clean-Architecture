import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<({Failure? failure, User? user})> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
