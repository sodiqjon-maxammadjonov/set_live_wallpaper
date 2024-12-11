part of 'library_bloc.dart';

@immutable
abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryLoadedState extends LibraryState {
  final List<MediaFromDbModel> media;

  LibraryLoadedState(this.media);
}

class LibraryErrorState extends LibraryState {
  final String error;

  LibraryErrorState(this.error);
}
