import '../../domain/entity/logo_entity.dart';

class LogoModel extends LogoEntity {
  LogoModel({
    required super.type,
    required super.url,
  });

  factory LogoModel.fromJson(Map<String, dynamic> json) {
    return LogoModel(
      type: json['type'],
      url: json['url'],
    );
  }
}
