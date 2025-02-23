import 'package:evaluation_project/core/resources/data_state.dart';
import 'package:evaluation_project/features/home_feature/data/models/barbers_model.dart';
import 'package:evaluation_project/features/home_feature/data/models/services_model.dart';

abstract class HomeRepository {
  Future<DataState<BarbersModel>> getBarbersList();

  Future<DataState<ServicesModel>> getServicesList();
}
