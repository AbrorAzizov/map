import 'package:boycot/core/config/api_config.dart';
import 'package:boycot/features/companies/domain/repo/products_repo.dart';
import 'package:boycot/features/companies/presentation/bloc/companies_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/companies/data/repository/boycot_products_repo_imp.dart';
import 'features/companies/domain/service/hug_face_service.dart';
final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Config
  sl.registerLazySingleton(
        () => AppApiConfig(
      baseUrl: 'https://api.boycottisraeli.biz/v1',
    ),
  );

  // Dio service
  sl.registerLazySingleton(
        () => DioService(sl<AppApiConfig>()),
  );

  // Repository
  sl.registerLazySingleton<BoycotProductsRepo>(
        () => BoycotProductsRepoImp(
      dio: sl<DioService>(),
    ),
  );

  // Bloc (FACTORY, not singleton)
  sl.registerFactory(
        () => CompaniesBloc(
      repository: sl<BoycotProductsRepo>(),
    ),
  );
}

