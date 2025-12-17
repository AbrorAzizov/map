import 'alternative_entity.dart';
import 'category_entity.dart';
import 'logo_entity.dart';

class BrandEntity {
  final String id;
  final String name;
  final String description;
  final String type;
  final LogoEntity logo;
  final List<CategoryEntity> categories;
  final List<AlternativeEntity> alternatives;

  const BrandEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.logo,
    required this.categories,
    required this.alternatives,
  });
}



