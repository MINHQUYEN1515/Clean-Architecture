import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/features/ride_booking/domain/usecases/request_ride.dart';
import 'package:language_app/features/ride_booking/presentation/cubit/ride_state.dart';

class RideCubit extends Cubit<RideState> {
  RideCubit(this._requestRide) : super(const RideState());

  final RequestRide _requestRide;

  Future<void> requestRide({
    required String pickupLocation,
    required String dropoffLocation,
  }) async {
    emit(state.copyWith(status: RideStatus.loading, failure: null));
    final result = await _requestRide(
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
    );
    if (result.failure != null) {
      emit(state.copyWith(
        status: RideStatus.failure,
        failure: result.failure,
      ));
    } else if (result.ride != null) {
      emit(state.copyWith(
        status: RideStatus.success,
        ride: result.ride,
      ));
    }
  }

  void reset() {
    emit(const RideState());
  }
}
