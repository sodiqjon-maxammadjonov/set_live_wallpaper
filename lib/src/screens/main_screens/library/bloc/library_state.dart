part of 'library_bloc.dart';

@immutable
sealed class LibraryState {}

final class LibraryInitial extends LibraryState {}

final class LibraryLoadingState extends LibraryState {}

final class LibraryEmptyState extends LibraryState {}

class LibrarySuccessState extends LibraryState {
  final List<File> mediaFiles;
  LibrarySuccessState(this.mediaFiles);
}

class LibraryErrorState extends LibraryState {
  final String errorMessage;
  LibraryErrorState(this.errorMessage);
}