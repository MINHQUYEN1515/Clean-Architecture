import 'package:language_app/features/ride_booking/domain/entities/ride.dart';

class RideModel extends Ride {
  const RideModel({
    required super.id,
    required super.pickupLocation,
    required super.dropoffLocation,
    required super.status,
  });

  factory RideModel.fromJson(Map<String, dynamic> json) {
    return RideModel(
      id: json['id'] as String,
      pickupLocation: json['pickup_location'] as String,
      dropoffLocation: json['dropoff_location'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pickup_location': pickupLocation,
      'dropoff_location': dropoffLocation,
      'status': status,
    };
  }
}
