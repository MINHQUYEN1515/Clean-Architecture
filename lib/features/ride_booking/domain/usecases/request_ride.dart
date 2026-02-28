import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/ride_booking/domain/entities/ride.dart';
import 'package:language_app/features/ride_booking/domain/repositories/ride_repository.dart';

class RequestRide {
  RequestRide(this._repository);

  final RideRepository _repository;

  Future<({Failure? failure, Ride? ride})> call({
    required String pickupLocation,
    required String dropoffLocation,
  }) {
    return _repository.requestRide(
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
    );
  }
}
