part of 'library_bloc.dart';

@immutable
abstract class LibraryEvent {}

class LoadMediaEvent extends LibraryEvent {}

class FilterMediaEvent extends LibraryEvent {
  final MediaType mediaType;

  FilterMediaEvent(this.mediaType);
}

enum MediaType { all, images, videos }
