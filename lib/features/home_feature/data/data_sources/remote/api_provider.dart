import 'package:dio/dio.dart';
import 'package:evaluation_project/core/routes/apis_routes.dart';
import 'package:evaluation_project/core/utils/general_api_handler.dart';

class HomeApiProvider {
  // Get the list of barbers from the server
  Future<Response> getBarbers() async {
    final Response result = await generalApi(
      method: 'get',
      url: Routes.barbers,
    );

    return result;
  }

  // Get the list of services from the server
  Future<Response> getServices() async {
    final Response result = await generalApi(
      method: 'get',
      url: Routes.services,
    );

    return result;
  }
}
