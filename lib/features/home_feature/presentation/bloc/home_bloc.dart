import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evaluation_project/core/resources/data_state.dart';
import 'package:evaluation_project/core/use_case/use_case.dart';
import 'package:evaluation_project/features/home_feature/data/models/barbers_model.dart';
import 'package:evaluation_project/features/home_feature/data/models/services_model.dart';
import 'package:evaluation_project/features/home_feature/domain/use_cases/use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.barbersUseCase,
    this.servicesUseCase,
  ) : super(HomeState(status: Status.initial)) {
    on<GetHomeDataEvent>(_getHomeData);
  }

  FutureOr<void> _getHomeData(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: Status.initial,
      ),
    );

    final DataState servicesDataState = await servicesUseCase(NoParams());
    final DataState barbersDataState = await barbersUseCase(NoParams());

    if (servicesDataState is DataFailed) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: servicesDataState.error,
        ),
      );
    } else if (barbersDataState is DataFailed) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: barbersDataState.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: Status.success,
          servicesList: servicesDataState.data,
          barbersList: barbersDataState.data,
        ),
      );
    }
  }

  GetBarbersUseCase barbersUseCase;
  GetServicesUseCase servicesUseCase;
}
