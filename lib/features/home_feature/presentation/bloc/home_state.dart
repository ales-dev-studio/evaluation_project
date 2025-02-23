part of 'home_bloc.dart';

enum Status { initial, success, failure }

class HomeState {
  HomeState({
    this.barbersList,
    this.servicesList,
    required this.status,
    this.errorMessage,
  });

  final BarbersModel? barbersList;
  final ServicesModel? servicesList;
  final Status status;
  final String? errorMessage;

  HomeState copyWith({
    BarbersModel? barbersList,
    ServicesModel? servicesList,
    Status? status,
    String? errorMessage,
  }) {
    return HomeState(
      barbersList: barbersList ?? this.barbersList,
      servicesList: servicesList ?? this.servicesList,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
