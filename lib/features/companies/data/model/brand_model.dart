
import '../../domain/entity/brand_entity.dart';
import 'alternative_model.dart';
import 'category_model.dart';
import 'logo_model.dart';

class BrandModel extends BrandEntity {
  BrandModel({
    required super.id,
    required super.name,
    required super.description,
    required super.type,

    required super.logo,
    required super.categories,
    required super.alternatives,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      type: json['type'],
      logo: LogoModel.fromJson(json['logo']),
      categories: (json['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      alternatives: (json['alternatives'] as List)
          .map((e) => AlternativeModel.fromJson(e))
          .toList(),
    );
  }
}
