import '../../domain/entity/alternative_entity.dart';
import 'logo_model.dart';

class AlternativeModel extends AlternativeEntity {
  AlternativeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.website,
    required super.logo,
  });

  factory AlternativeModel.fromJson(Map<String, dynamic> json) {
    return AlternativeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      website: json['website'],
      logo: LogoModel.fromJson(json['logo']),
    );
  }
}
