import 'package:boycot/features/companies/domain/entity/brand_entity.dart';

abstract class CompaniesState {}

class CompaniesInitial extends CompaniesState {}

class CompaniesLoading extends CompaniesState {}

class CompaniesLoaded extends CompaniesState {
  final List<BrandEntity> companies;
  final int? currentOffset ;
  CompaniesLoaded({required this.companies, this.currentOffset});
}

class CompaniesError extends CompaniesState {
  final String message;

  CompaniesError(this.message);
}
