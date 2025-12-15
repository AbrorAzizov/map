
abstract class HomeState {

}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final String productName;

  HomeSuccess(this.productName);

  @override
  List<Object?> get props => [productName];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
