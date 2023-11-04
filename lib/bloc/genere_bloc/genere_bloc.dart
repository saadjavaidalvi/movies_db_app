import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'genere_event.dart';
part 'genere_state.dart';

class GenereBloc extends Bloc<GenereEvent, GenereState> {
  GenereBloc() : super(GenereInitial()) {
    on<GenereEvent>((event, emit) {
      emit(GenereInitial());
    });
    on<GenereLoadedEvent>((GenereLoadedEvent event, Emitter<GenereState> emit) {
      emit(GenereLoadedState(event.genere));
    });
  }
}
