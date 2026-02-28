import 'package:language_app/features/ride_booking/data/datasources/ride_remote_data_source.dart';
import 'package:language_app/features/ride_booking/data/repositories/ride_repository_impl.dart';
import 'package:language_app/features/ride_booking/domain/repositories/ride_repository.dart';
import 'package:language_app/features/ride_booking/domain/usecases/request_ride.dart';
import 'package:language_app/features/ride_booking/presentation/cubit/ride_cubit.dart';

final rideRemoteDataSource = RideRemoteDataSourceImpl();
final RideRepository rideRepository =
    RideRepositoryImpl(rideRemoteDataSource);
final RequestRide requestRide = RequestRide(rideRepository);

RideCubit getRideCubit() => RideCubit(requestRide);
