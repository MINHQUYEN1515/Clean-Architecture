import 'package:language_app/core/errors/exceptions.dart';
import 'package:language_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: email.split('@').first,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
