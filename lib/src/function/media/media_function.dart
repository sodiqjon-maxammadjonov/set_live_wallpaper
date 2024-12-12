import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:set_live_wallpaper/src/screens/main_screens/library/bloc/library_bloc.dart';

class MediaFunction {
  static const MethodChannel _channel = MethodChannel('media_library_channel');
  final void Function(LibraryState)? emit;

  MediaFunction({this.emit});

  Future<void> fetchVideos() async {
    emit?.call(LibraryLoadingState());

    try {
      if (Platform.isAndroid) {
        await _fetchAndroidVideos();
      } else if (Platform.isIOS) {
        await _fetchIOSVideos();
      } else {
        emit?.call(LibraryErrorState('Qo\'llab-quvvatlanmaydigan platforma'));
      }
    } on PlatformException catch (e) {
      log('Platform xatosi: ${e.message}', name: 'fetchVideos');
      emit?.call(LibraryErrorState(e.message ?? 'Noma\'lum xatolik'));
    } catch (e) {
      log('Videolarni olishda xatolik: $e', name: 'fetchVideos');
      emit?.call(LibraryErrorState(e.toString()));
    }
  }

  Future<void> _fetchAndroidVideos() async {
    try {
      final result = await _channel.invokeMethod<List>('getVideosFromStorage');

      log('Android platformda videolar olindi.');
      log('Olingan videolar: $result');

      if (result == null || result.isEmpty) {
        emit?.call(LibraryEmptyState());
      } else {
        final videoFiles = result
            .map((path) => File(path.toString()))
            .toList();

        emit?.call(LibrarySuccessState(videoFiles));
      }
    } catch (e) {
      log('Android videolarini olishda xatolik: $e', name: 'fetchAndroidVideos');
      emit?.call(LibraryErrorState(e.toString()));
    }
  }

  Future<void> _fetchIOSVideos() async {
    try {
      final result = await _channel.invokeMethod<List>('getVideosFromGallery');

      log('iOS platformda videolar olindi.');
      log('Olingan videolar: $result');

      if (result == null || result.isEmpty) {
        emit?.call(LibraryEmptyState());
      } else {
        final videoFiles = result
            .map((path) => File(path.toString()))
            .toList();

        emit?.call(LibrarySuccessState(videoFiles));
      }
    } catch (e) {
      log('iOS videolarini olishda xatolik: $e', name: 'fetchIOSVideos');
      emit?.call(LibraryErrorState(e.toString()));
    }
  }

}

