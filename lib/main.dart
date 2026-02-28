import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/core/di/injection.dart';
import 'package:language_app/core/theme/app_theme.dart';
import 'package:language_app/features/ride_booking/presentation/cubit/ride_cubit.dart';
import 'package:language_app/features/ride_booking/presentation/pages/ride_booking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RideCubit>(
      create: (_) => getRideCubit(),
      child: MaterialApp(
        title: 'Language App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const RideBookingPage(),
      ),
    );
  }
}
