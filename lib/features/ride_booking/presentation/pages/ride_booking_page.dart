import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/features/ride_booking/presentation/cubit/ride_cubit.dart';
import 'package:language_app/features/ride_booking/presentation/cubit/ride_state.dart';

class RideBookingPage extends StatelessWidget {
  const RideBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RideBookingView();
  }
}

class _RideBookingView extends StatefulWidget {
  const _RideBookingView();

  @override
  State<_RideBookingView> createState() => _RideBookingViewState();
}

class _RideBookingViewState extends State<_RideBookingView> {
  final _pickupController = TextEditingController();
  final _dropoffController = TextEditingController();

  @override
  void dispose() {
    _pickupController.dispose();
    _dropoffController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Booking'),
      ),
      body: BlocConsumer<RideCubit, RideState>(
        listener: (context, state) {
          if (state.status == RideStatus.failure && state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure!.message ?? 'Error')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _pickupController,
                  decoration: const InputDecoration(
                    labelText: 'Pickup Location',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _dropoffController,
                  decoration: const InputDecoration(
                    labelText: 'Dropoff Location',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                if (state.status == RideStatus.loading)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    onPressed: () {
                      context.read<RideCubit>().requestRide(
                            pickupLocation: _pickupController.text,
                            dropoffLocation: _dropoffController.text,
                          );
                    },
                    child: const Text('Request Ride'),
                  ),
                if (state.status == RideStatus.success && state.ride != null) ...[
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ride ID: ${state.ride!.id}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text('Status: ${state.ride!.status}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
