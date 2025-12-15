import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio
  sl.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: "https://api.boycottisraeli.biz/v1")),
  );
}
