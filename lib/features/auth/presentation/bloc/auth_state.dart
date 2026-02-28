import 'package:equatable/equatable.dart';
import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/auth/domain/entities/user.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, failure }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.failure,
  });

  final AuthStatus status;
  final User? user;
  final Failure? failure;

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    Failure? failure,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, user, failure];
}
