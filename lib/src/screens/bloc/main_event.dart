part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class SwitchChangeEvent extends MainEvent {
  final int switchIndex;
  SwitchChangeEvent({required this.switchIndex});
}