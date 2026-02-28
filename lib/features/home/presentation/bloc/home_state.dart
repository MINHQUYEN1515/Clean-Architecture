import 'package:equatable/equatable.dart';
import 'package:language_app/core/errors/failures.dart';

enum HomeStatus { initial, loading, loaded, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.failure,
  });

  final HomeStatus status;
  final Failure? failure;

  HomeState copyWith({
    HomeStatus? status,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, failure];
}
