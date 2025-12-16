import '../../domain/service/hug_face_service.dart';

class BoycotProductsRepoImp {
  final DioService dio;

  BoycotProductsRepoImp({ required this.dio});

  Future<Map<String, dynamic>> getCompanies() async {
    final response = await dio.get<Map<String, dynamic>>('/user');
    return response.data!;
  }
}
