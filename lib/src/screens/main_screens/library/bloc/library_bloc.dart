import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:set_live_wallpaper/src/function/media/media_function.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(LibraryInitial()) {
    on<LibraryMediaLoadEvent>(libraryMediaLoadEvent);
  }

  FutureOr<void> libraryMediaLoadEvent(
      LibraryMediaLoadEvent event,
      Emitter<LibraryState> emit,
      ) async {
    emit(LibraryLoadingState());
    try {

      await MediaFunction(emit: emit.call).fetchVideos();
    } catch (e) {
      emit(LibraryErrorState('Videolarni olishda xatolik: $e'));
    }
  }
}
