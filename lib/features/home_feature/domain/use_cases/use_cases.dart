import 'package:evaluation_project/core/resources/data_state.dart';
import 'package:evaluation_project/core/use_case/use_case.dart';
import 'package:evaluation_project/features/home_feature/data/models/barbers_model.dart';
import 'package:evaluation_project/features/home_feature/data/models/services_model.dart';
import 'package:evaluation_project/features/home_feature/domain/repositories/home_repository.dart';

class GetBarbersUseCase extends UseCase<DataState<BarbersModel>, NoParams> {
  GetBarbersUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<DataState<BarbersModel>> call(final NoParams params) {
    return homeRepository.getBarbersList();
  }
}

class GetServicesUseCase extends UseCase<DataState<ServicesModel>, NoParams> {
  GetServicesUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<DataState<ServicesModel>> call(final NoParams params) {
    return homeRepository.getServicesList();
  }
}
