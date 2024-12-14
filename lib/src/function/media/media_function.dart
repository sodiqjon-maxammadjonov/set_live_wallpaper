import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:set_live_wallpaper/src/screens/main_screens/library/bloc/library_bloc.dart';

class MediaFunction {
  static const MethodChannel _channel = MethodChannel('media_library_channel');
  final void Function(LibraryState)? emit;

  MediaFunction({this.emit});

  Future<void> fetchImages() async {
    emit?.call(LibraryLoadingState());

    try {
      if (Platform.isAndroid) {
        await _fetchAndroidImages();
      } else if (Platform.isIOS) {
        await _fetchIOSImages();
      } else {
        emit?.call(LibraryErrorState('Qo\'llab-quvvatlanmaydigan platforma'));
      }
    } on PlatformException catch (e) {
      log('Platform xatosi: ${e.message}', name: 'fetchImages');
      emit?.call(LibraryErrorState(e.message ?? 'Noma\'lum xatolik'));
    } catch (e) {
      log('Rasmlarni olishda xatolik: $e', name: 'fetchImages');
      emit?.call(LibraryErrorState(e.toString()));
    }
  }

  Future<void> _fetchAndroidImages() async {
    try {
      final result = await _channel.invokeMethod<List>('getImagesFromStorage');

      log('Android platformda rasmlar olindi.');
      log('Olingan rasmlar: $result');

      if (result == null || result.isEmpty) {
        emit?.call(LibraryEmptyState());
      } else {
        final imageFiles = result.map((path) => File(path.toString())).toList();
        emit?.call(LibrarySuccessState(imageFiles));
      }
    } catch (e) {
      log('Android rasmlarini olishda xatolik: $e', name: 'fetchAndroidImages');
      emit?.call(LibraryErrorState(e.toString()));
    }
  }

  Future<void> _fetchIOSImages() async {
    try {
      final result = await _channel.invokeMethod<List>('getImagesFromGallery');

      log('iOS platformda rasmlar olindi.');
      log('Olingan rasmlar: $result');

      if (result == null || result.isEmpty) {
        emit?.call(LibraryEmptyState());
      } else {
        final imageFiles = result.map((path) => File(path.toString())).toList();
        emit?.call(LibrarySuccessState(imageFiles));
      }
    } catch (e) {
      log('iOS rasmlarini olishda xatolik: $e', name: 'fetchIOSImages');
      emit?.call(LibraryErrorState(e.toString()));
    }
  }
}
