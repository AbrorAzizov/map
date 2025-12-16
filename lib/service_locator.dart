import 'package:boycot/core/config/api_config.dart';
import 'package:boycot/features/home/domain/service/hug_face_service.dart';
import 'package:get_it/get_it.dart';
import 'features/home/data/repository/boycot_products_repo_imp.dart';

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
