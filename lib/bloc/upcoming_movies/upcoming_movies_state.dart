part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesState {}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoadedState extends UpcomingMoviesState {
  final List<MovieModel> moviesList;
  UpcomingMoviesLoadedState(this.moviesList);
}
