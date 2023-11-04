import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_db_app/models/movie_model.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesEvent>((event, emit) {
      emit(UpcomingMoviesInitial());
    });

    on<UpcomingMoviesLoadedEvent>(
        (UpcomingMoviesLoadedEvent event, Emitter<UpcomingMoviesState> emit) {
      emit(UpcomingMoviesLoadedState(event.moviesList));
    });
  }
}
