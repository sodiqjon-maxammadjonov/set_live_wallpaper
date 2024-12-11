import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:set_live_wallpaper/src/model/media/media_from_db_model.dart';

class MediaFunctions {
  Future<List<MediaFromDbModel>> loadMedia() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      throw Exception("Xotira uchun ruxsat berilmagan!");
    }

    final directory = Directory('/storage/emulated/0');
    if (!await directory.exists()) {
      throw Exception("Xotira katalogini yuklashda xatolik!");
    }

    final List<MediaFromDbModel> mediaItems = [];
    final List<FileSystemEntity> files = directory.listSync(recursive: true, followLinks: false);

    for (var file in files) {
      final path = file.path.toLowerCase();
      if (path.endsWith('.jpg') || path.endsWith('.jpeg') || path.endsWith('.png')) {
        mediaItems.add(MediaFromDbModel(path: file.path, type: MediaType.images));
      } else if (path.endsWith('.mp4') || path.endsWith('.mkv')) {
        mediaItems.add(MediaFromDbModel(path: file.path, type: MediaType.videos));
      }
    }

    return mediaItems;
  }
}
