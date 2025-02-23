import 'package:evaluation_project/core/locators/locator.dart';
import 'package:evaluation_project/features/home_feature/data/data_sources/remote/api_provider.dart';
import 'package:evaluation_project/features/home_feature/data/repositories/home_repository_impl.dart';
import 'package:evaluation_project/features/home_feature/domain/repositories/home_repository.dart';
import 'package:evaluation_project/features/home_feature/domain/use_cases/use_cases.dart';

Future<void> setupHomeLocators() async {
  // register api provider
  locator.registerSingleton<HomeApiProvider>(
    HomeApiProvider(),
  );

  // register repository
  locator.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(locator()),
  );

  // register use cases
  locator.registerSingleton<GetBarbersUseCase>(
    GetBarbersUseCase(locator()),
  );
  locator.registerSingleton<GetServicesUseCase>(
    GetServicesUseCase(locator()),
  );
}
