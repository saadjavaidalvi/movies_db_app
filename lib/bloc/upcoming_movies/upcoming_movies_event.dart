part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesEvent {}

class UpcomingMoviesLoadedEvent extends UpcomingMoviesEvent {
  final List<MovieModel> moviesList;
  UpcomingMoviesLoadedEvent(this.moviesList);
}
