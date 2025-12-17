import 'package:boycot/features/companies/domain/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'companies_event.dart';
import 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  final BoycotProductsRepo repository;

  CompaniesBloc({required this.repository})
      : super(CompaniesInitial()) {
    on<LoadCompaniesEvent>(_onLoadCompanies);
    on<SearchCompaniesEvent>(_onSearchCompanies);
  }

  Future<void> _onLoadCompanies(
      LoadCompaniesEvent event,
      Emitter<CompaniesState> emit,
      ) async {
    emit(CompaniesLoading());

    try {
      final companies = await repository.getCompanies();
      emit(CompaniesLoaded(companies));
    } catch (e) {
      emit(CompaniesError(e.toString()));
    }
  }

  Future<void> _onSearchCompanies(
      SearchCompaniesEvent event,
      Emitter<CompaniesState> emit,
      ) async {
    emit(CompaniesLoading());

    try {
      final companies = await repository.searchCompanies(event.query);
      emit(CompaniesLoaded(companies));
    } catch (e) {
      emit(CompaniesError(e.toString()));
    }
  }
}
