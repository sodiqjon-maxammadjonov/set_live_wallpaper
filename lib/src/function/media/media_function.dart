import 'dart:developer';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:set_live_wallpaper/src/model/media/media_from_db_model.dart';

class MediaFunctions {
  Future<List<MediaFromDbModel>> loadMedia() async {
    final status = await Permission.storage.request();
    log('Xotira ruxsati: ${status.isGranted ? "Ruxsat berildi" : "Ruxsat berilmagan"}', name: 'loadMedia');

    if (!status.isGranted) {
      throw Exception("Xotira uchun ruxsat berilmagan!");
    }

    final directory = Directory('/storage/emulated/0'); // Android tizimida xotira yo‘li
    log('Xotira katalogi: ${directory.path}', name: 'directory');

    if (!await directory.exists()) {
      print('Xotira katalogini yuklashda xatolik!');
      throw Exception("Xotira katalogini yuklashda xatolik!");
    }

    final List<MediaFromDbModel> mediaItems = [];
    final List<FileSystemEntity> files = directory.listSync(recursive: true, followLinks: false);
    log('Fayllar ro\'yxati: ${files.length} ta fayl topildi.');

    for (var file in files) {
      final path = file.path.toLowerCase();
      log('Fayl: $path');

      if (path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png')) {
        log('Rasm topildi: $path');
        mediaItems.add(MediaFromDbModel(path: file.path, type: MediaType.images));
      } else if (path.endsWith('.mp4') || path.endsWith('.mkv')) {
        log('Video topildi: $path');
        mediaItems.add(MediaFromDbModel(path: file.path, type: MediaType.videos));
      }
    }

    log('Jami media elementlari: ${mediaItems.length}');
    return mediaItems;
  }
}
