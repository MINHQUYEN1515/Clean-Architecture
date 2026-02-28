import 'package:equatable/equatable.dart';
import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/ride_booking/domain/entities/ride.dart';

enum RideStatus { initial, loading, success, failure }

class RideState extends Equatable {
  const RideState({
    this.status = RideStatus.initial,
    this.ride,
    this.failure,
  });

  final RideStatus status;
  final Ride? ride;
  final Failure? failure;

  RideState copyWith({
    RideStatus? status,
    Ride? ride,
    Failure? failure,
  }) {
    return RideState(
      status: status ?? this.status,
      ride: ride ?? this.ride,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, ride, failure];
}
