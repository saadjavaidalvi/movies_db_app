part of 'genere_bloc.dart';

@immutable
sealed class GenereState {}

final class GenereInitial extends GenereState {}

final class GenereLoadedState extends GenereState {
  final List genere;
  GenereLoadedState(this.genere);
}
