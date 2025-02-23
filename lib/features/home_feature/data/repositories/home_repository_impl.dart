import 'package:dio/dio.dart';
import 'package:evaluation_project/core/resources/data_state.dart';
import 'package:evaluation_project/core/utils/response_error_handler.dart';
import 'package:evaluation_project/features/home_feature/data/data_sources/remote/api_provider.dart';
import 'package:evaluation_project/features/home_feature/data/models/barbers_model.dart';
import 'package:evaluation_project/features/home_feature/data/models/services_model.dart';
import 'package:evaluation_project/features/home_feature/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.apiProvider);

  HomeApiProvider apiProvider;

  @override
  Future<DataState<BarbersModel>> getBarbersList() async {
    try {
      final Response response = await apiProvider.getBarbers();

      if (response.statusCode == 200) {
        final BarbersModel barbersModel = BarbersModel.fromJson(
          response.data,
        );
        return DataSuccess(barbersModel);
      } else {
        return DataFailed(responseErrorHandler());
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<ServicesModel>> getServicesList() async {
    try {
      final Response response = await apiProvider.getBarbers();

      if (response.statusCode == 200) {
        final ServicesModel servicesModel = ServicesModel.fromJson(
          response.data,
        );
        return DataSuccess(servicesModel);
      } else {
        return DataFailed(responseErrorHandler());
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }
}
