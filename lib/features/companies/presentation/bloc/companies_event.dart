abstract class CompaniesEvent {}

class LoadCompaniesEvent extends CompaniesEvent {
 final int offset ;
 LoadCompaniesEvent({ this.offset = 0});
}

class LoadMoreCompaniesEvent extends CompaniesEvent {
  final int offset ;
  LoadMoreCompaniesEvent({required this.offset});
}

class SearchCompaniesEvent extends CompaniesEvent {
  final String query;

  SearchCompaniesEvent(this.query);
}
