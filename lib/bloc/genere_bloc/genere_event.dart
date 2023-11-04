part of 'genere_bloc.dart';

@immutable
sealed class GenereEvent {}

class GenereLoadedEvent extends GenereEvent {
  final List genere;
  GenereLoadedEvent(this.genere);
}
