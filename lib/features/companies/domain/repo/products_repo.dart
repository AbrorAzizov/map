import '../entity/brand_entity.dart';

abstract class BoycotProductsRepo {
  Future<List<BrandEntity>> getCompanies();
  Future<List<BrandEntity>> searchCompanies(String query);
}
