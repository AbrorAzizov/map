import '../../domain/entity/brand_entity.dart';
import '../../domain/repo/products_repo.dart';
import '../../domain/service/hug_face_service.dart';
import '../model/brand_model.dart';

class BoycotProductsRepoImp implements BoycotProductsRepo {
  final DioService dio;

  BoycotProductsRepoImp({required this.dio});

  @override
  Future<List<BrandEntity>> getCompanies({required int offset}) async {
    final response = await dio.get('/companies',query:{
      'limit': 4,
      'offset': offset,
    });

    final List data = response.data['data'];

    return data
        .map((json) => BrandModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<BrandEntity>> searchCompanies(String query) async {
    final response = await dio.get('/search/$query',query: {
      'limit': 6,
      'offset': 0,
    });

    final List data = response.data['data'];

    return data
        .map((json) => BrandModel.fromJson(json))
        .toList();
  }
}
