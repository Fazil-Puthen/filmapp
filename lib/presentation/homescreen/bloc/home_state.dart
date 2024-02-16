part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class Moviefetched extends HomeState{
  final moviemodel movie;
  Moviefetched({
    required this.movie
  });
}
