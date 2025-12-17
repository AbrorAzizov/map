import 'package:boycot/core/config/api_config.dart';
import 'package:get_it/get_it.dart';

import 'features/companies/data/repository/boycot_products_repo_imp.dart';
import 'features/companies/domain/service/hug_face_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio

  sl.registerLazySingleton<BoycotProductsRepoImp>(
    () => BoycotProductsRepoImp(
      dio: DioService(
        AppApiConfig(baseUrl: 'https://api.boycottisraeli.biz/v1'),
      ),
    ),
  );

}
