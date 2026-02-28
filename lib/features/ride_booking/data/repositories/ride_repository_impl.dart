import 'package:language_app/core/errors/exceptions.dart';
import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/ride_booking/data/datasources/ride_remote_data_source.dart';
import 'package:language_app/features/ride_booking/domain/entities/ride.dart';
import 'package:language_app/features/ride_booking/domain/repositories/ride_repository.dart';

class RideRepositoryImpl implements RideRepository {
  RideRepositoryImpl(this._remoteDataSource);

  final RideRemoteDataSource _remoteDataSource;

  @override
  Future<({Failure? failure, Ride? ride})> requestRide({
    required String pickupLocation,
    required String dropoffLocation,
  }) async {
    try {
      final ride = await _remoteDataSource.requestRide(
        pickupLocation: pickupLocation,
        dropoffLocation: dropoffLocation,
      );
      return (failure: null, ride: ride);
    } on ServerException catch (e) {
      return (failure: ServerFailure(e.message), ride: null);
    }
  }
}
