abstract class CompaniesEvent {}

class LoadCompaniesEvent extends CompaniesEvent {}

class SearchCompaniesEvent extends CompaniesEvent {
  final String query;

  SearchCompaniesEvent(this.query);
}
