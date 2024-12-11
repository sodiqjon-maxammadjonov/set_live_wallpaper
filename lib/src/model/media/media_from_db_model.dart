enum MediaType { all, images, videos }

class MediaFromDbModel {
  final String path;
  final MediaType type;

  MediaFromDbModel({required this.path, required this.type});
}
