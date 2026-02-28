import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/features/auth/domain/usecases/login.dart';
import 'package:language_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:language_app/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._login) : super(const AuthState()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  final Login _login;

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, failure: null));
    final result = await _login(
      email: event.email,
      password: event.password,
    );
    if (result.failure != null) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        failure: result.failure,
      ));
    } else if (result.user != null) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: result.user,
      ));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
      user: null,
    ));
  }
}
