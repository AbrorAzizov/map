import '../../domain/entity/brand_entity.dart';
import '../../domain/repo/products_repo.dart';
import '../../domain/service/hug_face_service.dart';
import '../model/brand_model.dart';

class BoycotProductsRepoImp implements BoycotProductsRepo {
  final DioService dio;

  BoycotProductsRepoImp({required this.dio});

  @override
  Future<List<BrandEntity>> getCompanies() async {
    final response = await dio.get('/user');

    final List data = response.data['data'];

    return data
        .map((json) => BrandModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<BrandEntity>> searchCompanies(String query) async {
    final response = await dio.get('/search/$query');

    final List data = response.data['data'];

    return data
        .map((json) => BrandModel.fromJson(json))
        .toList();
  }
}
