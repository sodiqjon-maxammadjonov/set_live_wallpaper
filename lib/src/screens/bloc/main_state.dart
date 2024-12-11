part of 'main_bloc.dart';

@immutable
abstract class MainState {
  final int switchIndex;

  MainState({required this.switchIndex});
}

final class MainInitial extends MainState {
  MainInitial({required super.switchIndex});
}


