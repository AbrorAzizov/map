import 'logo_entity.dart';

class AlternativeEntity {
  final String id;
  final String name;
  final String description;
  final String website;
  final LogoEntity logo;

  const AlternativeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.logo,
  });
}