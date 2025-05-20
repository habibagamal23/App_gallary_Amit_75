part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  List<String > items ;
  HomeSuccess(this.items);
}

class HomeError extends HomeState {
  String error ;
  HomeError(this.error);
}