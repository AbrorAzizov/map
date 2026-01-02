import '../entity/brand_entity.dart';

abstract class BoycotProductsRepo {
  Future<List<BrandEntity>> getCompanies({required int offset});
  Future<List<BrandEntity>> searchCompanies(String query);
}
