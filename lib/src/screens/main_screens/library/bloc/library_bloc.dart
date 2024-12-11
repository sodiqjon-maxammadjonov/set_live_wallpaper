import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:set_live_wallpaper/src/model/media/media_from_db_model.dart';
import '../../../../function/media/media_function.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final MediaFunctions mediaFunctions;
  List<MediaFromDbModel> _allMedia = [];

  LibraryBloc({required this.mediaFunctions}) : super(LibraryInitial()) {
    on<LoadMediaEvent>((event, emit) async {
      emit(LibraryLoadingState());
      try {
        _allMedia = await mediaFunctions.loadMedia();
        emit(LibraryLoadedState(_allMedia));
      } catch (e) {
        emit(LibraryErrorState("Media yuklashda xatolik yuz berdi: $e"));
      }
    });

    on<FilterMediaEvent>((event, emit) {
      if (event.mediaType == MediaType.all) {
        emit(LibraryLoadedState(_allMedia));
      } else {
        final filteredMedia = _allMedia
            .where((item) => item.type == event.mediaType)
            .toList();
        emit(LibraryLoadedState(filteredMedia));
      }
    });
  }
}
