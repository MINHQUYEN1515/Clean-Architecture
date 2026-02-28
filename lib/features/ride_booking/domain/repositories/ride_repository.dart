import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/ride_booking/domain/entities/ride.dart';

abstract class RideRepository {
  Future<({Failure? failure, Ride? ride})> requestRide({
    required String pickupLocation,
    required String dropoffLocation,
  });
}
