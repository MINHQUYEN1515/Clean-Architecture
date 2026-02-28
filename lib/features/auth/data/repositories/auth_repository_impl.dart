import 'package:language_app/core/errors/exceptions.dart';
import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:language_app/features/auth/domain/entities/user.dart';
import 'package:language_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<({Failure? failure, User? user})> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      return (failure: null, user: user);
    } on ServerException catch (e) {
      return (failure: ServerFailure(e.message), user: null);
    }
  }

  @override
  Future<void> logout() async {
    await Future<void>.value();
  }
}
