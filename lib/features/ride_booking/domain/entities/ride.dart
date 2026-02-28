import 'package:equatable/equatable.dart';

class Ride extends Equatable {
  const Ride({
    required this.id,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.status,
  });

  final String id;
  final String pickupLocation;
  final String dropoffLocation;
  final String status;

  @override
  List<Object?> get props => [id, pickupLocation, dropoffLocation, status];
}
