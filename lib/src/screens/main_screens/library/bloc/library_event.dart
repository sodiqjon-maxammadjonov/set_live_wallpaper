part of 'library_bloc.dart';

@immutable
sealed class LibraryEvent {}

final class LibraryMediaLoadEvent extends LibraryEvent {}