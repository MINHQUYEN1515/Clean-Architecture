import 'package:language_app/core/errors/exceptions.dart';
import 'package:language_app/features/ride_booking/data/models/ride_model.dart';

abstract class RideRemoteDataSource {
  Future<RideModel> requestRide({
    required String pickupLocation,
    required String dropoffLocation,
  });
}

class RideRemoteDataSourceImpl implements RideRemoteDataSource {
  @override
  Future<RideModel> requestRide({
    required String pickupLocation,
    required String dropoffLocation,
  }) async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return RideModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        pickupLocation: pickupLocation,
        dropoffLocation: dropoffLocation,
        status: 'requested',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
