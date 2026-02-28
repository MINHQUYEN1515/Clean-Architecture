import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_app/core/errors/failures.dart';
import 'package:language_app/features/home/presentation/bloc/home_event.dart';
import 'package:language_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeRequested>(_onHomeRequested);
  }

  Future<void> _onHomeRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading, failure: null));
    try {
      // Simulate loading - replace with actual use case
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(status: HomeStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        failure: ServerFailure(e.toString()),
      ));
    }
  }
}
